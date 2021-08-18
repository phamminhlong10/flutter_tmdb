import 'package:equatable/equatable.dart';
import 'package:rest_api_movies/models/movie.dart';
import 'package:rest_api_movies/models/person.dart';

abstract class DetailsPersonState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DetailsPersonInitialState extends DetailsPersonState{
}

class DetailsPersonLoadingState extends DetailsPersonState{}

class DetailsPersonLoadedState extends DetailsPersonState{
  final Person person;
  final List<Movie>? movies;

  DetailsPersonLoadedState({required this.person, this.movies});

  @override
  // TODO: implement props
  List<Object?> get props => [person, movies];
}

class DetailsPersonFailureState extends DetailsPersonState{}