import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rest_api_movies/blocs/recommend_bloc.dart';
import 'package:rest_api_movies/blocs/trailer_bloc.dart';
import 'package:rest_api_movies/events/trailer_event.dart';
import 'package:rest_api_movies/pages/movie_details.dart';
import 'package:rest_api_movies/state/recommend_state.dart';

class RecommendMovie extends StatelessWidget {
  const RecommendMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendBloc, RecommendState>(
      builder: (context, state) {
        if (state is RecommendLoadedState) {
          return Column(
            children: [
              Container(
                height: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://www.themoviedb.org/t/p/original/${state.movie.poster}"),
                        fit: BoxFit.cover)),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => BlocProvider.of<TrailerBloc>(context).add(
                    OpenTrailerEvent(
                        id: state.movie.id, mediaType: state.movie.mediaType)),
                child: Container(
                  height: 50,
                  //color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 85,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Icon(Icons.play_arrow),
                            Text(
                              "TRAILER",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.info_outline, color: Colors.white,),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MovieDetails(
                              id: state.movie.id,
                              mediaType: state.movie.mediaType,
                            );
                          }));
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        }
        return SpinKitFadingCircle(
          size: 64.0,
          color: Theme.of(context).accentColor,
        );
      },
    );
  }
}
