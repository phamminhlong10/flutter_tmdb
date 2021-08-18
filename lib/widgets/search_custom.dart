import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rest_api_movies/events/search_event.dart';
import 'package:rest_api_movies/pages/movie_details.dart';
import 'package:rest_api_movies/state/search_state.dart';

class SearchCustom extends SearchDelegate {
  final Bloc<SearchEvent, SearchState> searchBloc;

  SearchCustom({required this.searchBloc})
      : super(
          searchFieldLabel: "Search here!",
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  Widget buildSuggestions(BuildContext context) {
    searchBloc.add(OnChangeQuerySearchEvent(query: query));
    // TODO: implement buildSuggestions
    return BlocBuilder(
      bloc: searchBloc,
      builder: (context, state) {
        if (state is IsLoadingSearchState) {
          return SpinKitFadingCircle(
            size: 64.0,
            color: Theme.of(context).accentColor,
          );
        } else if (state is SuccessSearchState) {
          return Container(
            child: ListView.builder(
                itemCount: state.results!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                      return MovieDetails(id: state.results![index].id, mediaType: state.results![index].mediaType);
                    })),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        child: Row(
                          children: [
                            (state.results![index].poster != null
                                ? ClipRRect(
                              child: Image.network(
                                "https://www.themoviedb.org/t/p/w188_and_h282_bestv2/${state.results![index].poster}",),
                              borderRadius: BorderRadius.circular(10),
                            )
                                : Container(
                              width: 133,
                              height: 282,
                              color: Colors.grey[400],
                            )),
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    state.results![index].title != null
                                        ? Text("${state.results![index].title}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1,
                                    )
                                        : Text("${state.results![index].tvName}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1),
                                    Text(
                                        "${state.results![index].mediaType.toUpperCase()}",
                                        style:
                                        Theme.of(context).textTheme.subtitle1),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        }
        return Text("Has error");
      },
    );
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    searchBloc.add(OnChangeQuerySearchEvent(query: query));
    // TODO: implement buildResults
    return BlocBuilder(
      bloc: searchBloc,
      builder: (context, state) {
        if (state is IsLoadingSearchState) {
          return SpinKitFadingCircle(
            size: 64.0,
            color: Theme.of(context).accentColor,
          );
        } else if (state is SuccessSearchState) {
          return Container(
            child: ListView.builder(
                itemCount: state.results!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                      return MovieDetails(id: state.results![index].id, mediaType: state.results![index].mediaType);
                    })),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        child: Row(
                          children: [
                            (state.results![index].poster != null
                                ? ClipRRect(
                              child: Image.network(
                                "https://www.themoviedb.org/t/p/w188_and_h282_bestv2/${state.results![index].poster}",),
                              borderRadius: BorderRadius.circular(10),
                            )
                                : Container(
                              width: 133,
                              height: 282,
                              color: Colors.grey[400],
                            )),
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    state.results![index].title != null
                                        ? Text("${state.results![index].title}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1,
                                    )
                                        : Text("${state.results![index].tvName}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1),
                                    Text(
                                        "${state.results![index].mediaType.toUpperCase()}",
                                        style:
                                        Theme.of(context).textTheme.subtitle1),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          );
        }
        return Text("Has error");
      },
    );
  }
}
