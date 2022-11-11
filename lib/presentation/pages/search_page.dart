import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/movie_search_notifier.dart';
import 'package:ditonton/presentation/provider/tv_series_search_notifier.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:ditonton/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum SearchType { TV, MOVIE }

class SearchPage extends StatefulWidget {
  static const ROUTE_NAME = '/search';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchType? _typeSelected = SearchType.TV;
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                Provider.of<TvSeriesSearchNotifier>(context, listen: false)
                    .fetchTvSeriesSearch(query);
                Provider.of<MovieSearchNotifier>(context, listen: false)
                    .fetchMovieSearch(query);
                setState(() {
                  isSearch = true;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            SizedBox(height: 16),
            Column(
              children: [
                ListTile(
                  title: Text("TV Series"),
                  leading: Radio<SearchType>(
                    value: SearchType.TV,
                    groupValue: _typeSelected,
                    fillColor: MaterialStateColor.resolveWith((states) => kMikadoYellow),
                    onChanged: (SearchType? value) {
                      setState(() {
                        isSearch = false;
                        _typeSelected = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text("Movies"),
                  leading: Radio<SearchType>(
                    value: SearchType.MOVIE,
                    groupValue: _typeSelected,
                    fillColor: MaterialStateColor.resolveWith((states) => kMikadoYellow),
                    onChanged: (SearchType? value) {
                      print(value);
                      setState(() {
                        isSearch = false;
                        _typeSelected = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            result()
          ],
        ),
      ),
    );
  }

  Widget result() {
    if (isSearch) {
      if (_typeSelected == SearchType.TV) {
        return Consumer<TvSeriesSearchNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.Loaded) {
              final result = data.searchResult;
              return Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    final tv = data.searchResult[index];
                    return TvSeriesCardList(
                      data: tv,
                    );
                  },
                  itemCount: result.length,
                ),
              );
            } else {
              return Expanded(
                child: Container(),
              );
            }
          },
        );
      } else if (_typeSelected == SearchType.MOVIE) {
        return Consumer<MovieSearchNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.Loaded) {
              final result = data.searchResult;
              return Expanded(
                  child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final movie = data.searchResult[index];
                  return MovieCard(movie);
                },
                itemCount: result.length,
              ));
            } else {
              return Expanded(
                child: Container(),
              );
            }
          },
        );
      }
    }
    return Expanded(child: Container());
  }
}
