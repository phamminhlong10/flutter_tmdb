import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_movies/blocs/recommend_bloc.dart';
import 'package:rest_api_movies/blocs/popular_persons_bloc.dart';
import 'package:rest_api_movies/blocs/popular_tvShows_bloc.dart';
import 'package:rest_api_movies/blocs/popular_movies_bloc.dart';
import 'package:rest_api_movies/blocs/search_bloc.dart';
import 'package:rest_api_movies/blocs/trailer_bloc.dart';
import 'package:rest_api_movies/events/recommend_event.dart';
import 'package:rest_api_movies/events/popular_persons.dart';
import 'package:rest_api_movies/events/popular_tvShows_event.dart';
import 'package:rest_api_movies/pages/home.dart';
import 'package:rest_api_movies/repository/launchURL.dart';
import 'package:rest_api_movies/widgets/theme.dart';

import 'blocs/details_bloc.dart';
import 'events/popular_movies_event.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildTheme(),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PopularMoviesBloc>(
              create: (context)=>PopularMoviesBloc()..add(FetchPopularMoviesEvent())),
          BlocProvider<DetailsBloc>(
              create: (context) => DetailsBloc(),
          ),
          BlocProvider<PopularTVShowBloc>(
            create: (context) => PopularTVShowBloc()..add(FetchPopularTVShowsEvent()),
          ),
          BlocProvider<PopularPersonsBloc>(
            create: (context) => PopularPersonsBloc()..add(FetchPopularPersonEvent()),
          ),
          BlocProvider<RecommendBloc>(
            create: (context) => RecommendBloc()..add(FetchRecommendEvent()),
          ),
          BlocProvider<TrailerBloc>(
            create: (context) => TrailerBloc(launchURL: new LaunchURL()),
          ),
          BlocProvider<SearchBloc>(
            create: (context) => SearchBloc(),
          ),
        ],
        child: Home(),
      ),
    );
  }
}
