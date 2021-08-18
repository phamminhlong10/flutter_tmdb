import 'package:equatable/equatable.dart';
import 'package:rest_api_movies/models/movie.dart';

abstract class PopularMoviesState extends Equatable{
  PopularMoviesState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PopularMoviesSuccessState extends PopularMoviesState{
  final List<Movie> movies;
  PopularMoviesSuccessState({required this.movies});

  @override
  // TODO: implement props
  List<Object?> get props => [movies];
}

class PopularMoviesFailureState extends PopularMoviesState{}

class PopularMoviesInitialState extends PopularMoviesState{}