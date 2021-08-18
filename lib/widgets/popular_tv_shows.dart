import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rest_api_movies/blocs/popular_tvShows_bloc.dart';
import 'package:rest_api_movies/pages/movie_details.dart';
import 'package:rest_api_movies/state/popular_tvShows_state.dart';

class PopularTVShows extends StatelessWidget {
  const PopularTVShows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularTVShowBloc, PopularTVShowsState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("POPULAR TV SERIES",
                style: Theme.of(context).textTheme.subtitle1
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    if (state is PopularTVShowsSuccessState) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return MovieDetails(id: state.movies[index].id, mediaType: "tv");
                              }));
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 8, 0),
                          child: Column(
                            children: [
                              ClipRRect(
                                child: Image.network(
                                  "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/${state.movies[index].poster}",
                                  width: 150,
                                  height: 225,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (state is PopularTVShowsFailureState) {
                      return Text("Fail to connecting to server");
                    }
                    return SpinKitFadingCircle(
                      size: 64.0,
                      color: Theme.of(context).accentColor,
                    );
                  },
                ),
              ),
            ],
          ),

        );
      },
    );
  }
}
