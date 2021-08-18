import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rest_api_movies/blocs/details_bloc.dart';
import 'package:rest_api_movies/blocs/trailer_bloc.dart';
import 'package:rest_api_movies/events/details_event.dart';
import 'package:rest_api_movies/repository/launchURL.dart';
import 'package:rest_api_movies/state/details_state.dart';
import 'package:rest_api_movies/widgets/details/about_movie.dart';
import 'package:rest_api_movies/widgets/details/app_bar_details.dart';
import 'package:rest_api_movies/widgets/details/list_backdrops.dart';
import 'package:rest_api_movies/widgets/details/list_casts.dart';
import 'package:rest_api_movies/widgets/details/streaming_on.dart';

class MovieDetails extends StatelessWidget {
  final int id;
  final String mediaType;
  final LaunchURL launchURL = new LaunchURL();
  MovieDetails({Key? key, required this.id, required this.mediaType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailsBloc>(
            create: (context)=>DetailsBloc()..add(DetailTabEvent(id: id, mediaType: mediaType))),
        BlocProvider<TrailerBloc>(
          create: (context)=>TrailerBloc(launchURL: launchURL),
        )
      ],
      child: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoadedState) {
            return Scaffold(
              body: CustomScrollView(
                slivers: <Widget>[
                  AppBarDetails(poster: state.movie.poster),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Column(
                          children: [
                            AboutMovie(movie: state.movie, mediaType: mediaType),
                            state.providers!.length > 0
                                ? StreamingOn(listStreaming: state.providers)
                                : Text("..."),
                            ListCast(casts: state.casts),
                            ListBackDrops(originalImage: state.images)
                          ],
                        );
                    }, childCount: 1),
                  ),
                ],
              ),
            );
          } else if (state is DetailsIsLoadingState) {
            Scaffold(
              body: Center(
                child: SpinKitFadingCircle(
                  size: 64.0,
                  color: Theme.of(context).accentColor,
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: SpinKitFadingCircle(
                size: 64.0,
                color: Theme.of(context).accentColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
