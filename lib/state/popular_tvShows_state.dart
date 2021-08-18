import 'package:equatable/equatable.dart';
import 'package:rest_api_movies/models/movie.dart';
import 'package:rest_api_movies/models/provider.dart';

abstract class PopularTVShowsState extends Equatable{
  PopularTVShowsState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PopularTVShowsInitialState extends PopularTVShowsState{

}

class PopularTVShowsFailureState extends PopularTVShowsState{
}

class PopularTVShowsSuccessState extends PopularTVShowsState{
  final List<Movie> movies;

  PopularTVShowsSuccessState({required this.movies});

  @override
  // TODO: implement props
  List<Object?> get props => [movies];
}