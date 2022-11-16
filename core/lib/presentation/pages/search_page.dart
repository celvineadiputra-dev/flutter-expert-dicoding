import 'package:core/core.dart';
import 'package:core/presentation/provider/movie_search_notifier.dart';
import 'package:core/presentation/provider/tv_series_search_notifier.dart';
import 'package:core/presentation/widgets/movie_card_list.dart';
import 'package:core/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum SearchType { TV, MOVIE }

class SearchPage extends StatefulWidget {
  static const ROUTE_NAME = '/search';

  late bool isSearch;
  SearchType? typeSelected;

  SearchPage({this.isSearch = false, this.typeSelected = SearchType.TV});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
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
                  widget.isSearch = true;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                ListTile(
                  title: const Text("TV Series"),
                  leading: Radio<SearchType>(
                    value: SearchType.TV,
                    groupValue: widget.typeSelected,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => kMikadoYellow),
                    onChanged: (SearchType? value) {
                      setState(() {
                        widget.isSearch = false;
                        widget.typeSelected = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text("Movies"),
                  leading: Radio<SearchType>(
                    value: SearchType.MOVIE,
                    groupValue: widget.typeSelected,
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => kMikadoYellow),
                    onChanged: (SearchType? value) {
                      print(value);
                      setState(() {
                        widget.isSearch = false;
                        widget.typeSelected = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
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
    if (widget.isSearch) {
      if (widget.typeSelected == SearchType.TV) {
        return Consumer<TvSeriesSearchNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.Loading) {
              return const Center(
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
                child: Container(
                  key: const Key("container-tv-series-empty"),
                ),
              );
            }
          },
        );
      } else if (widget.typeSelected == SearchType.MOVIE) {
        return Consumer<MovieSearchNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.Loading) {
              return const Center(
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
                child: Container(
                  key: const Key("container-movie-empty"),
                ),
              );
            }
          },
        );
      }
    }
    return Expanded(
        child: Container(
      key: const Key("container-default"),
    ));
  }
}
