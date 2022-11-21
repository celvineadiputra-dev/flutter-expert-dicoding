import 'package:core/core.dart';
import 'package:movie/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/presentation/bloc/search_movie_bloc.dart';
import 'package:search/presentation/bloc/search_movie_event.dart';
import 'package:search/presentation/bloc/search_movie_state.dart';
import 'package:search/presentation/bloc/search_tv_series_bloc.dart';
import 'package:search/presentation/bloc/search_tv_series_event.dart';
import 'package:search/presentation/bloc/search_tv_series_state.dart';
import 'package:tvseries/presentation/widgets/tv_series_card_list.dart';

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
                if (widget.typeSelected == SearchType.TV) {
                  context
                      .read<SearchTvSeriesBloc>()
                      .add(QuerySearchTvSeries(query));
                } else {
                  context.read<SearchMovieBloc>().add(QuerySearchMovie(query));
                }
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
        return BlocBuilder<SearchTvSeriesBloc, SearchTvSeriesState>(
          builder: (context, data) {
            if (data is SearchTvSeriesLoading) {
              if (data.tvSeriesState == RequestState.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.tvSeriesState == RequestState.Empty) {
                return const Center(
                  key: Key("container-tv-series-empty"),
                  child: Text("TV Series Not Found"),
                );
              }
            } else if (data is SearchTvSeriesHasData) {
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
            } else if (data is SearchTvSeriesError) {
              return const Center(
                child: Text("Failed search movie"),
              );
            }

            return Expanded(child: Container());
          },
        );
      } else if (widget.typeSelected == SearchType.MOVIE) {
        return BlocBuilder<SearchMovieBloc, SearchMovieState>(
          builder: (context, data) {
            if (data is SearchMovieLoading) {
              if (data.movieState == RequestState.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.movieState == RequestState.Empty) {
                return const Center(
                  key: Key("container-movie-empty"),
                  child: Text("Movie Not Found"),
                );
              }
            } else if (data is SearchMovieHasData) {
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
            } else if (data is SearchMovieError) {
              return const Center(
                child: Text("Failed search movie"),
              );
            }
            return Expanded(child: Container());
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
