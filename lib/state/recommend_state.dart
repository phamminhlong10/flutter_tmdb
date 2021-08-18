import 'package:equatable/equatable.dart';
import 'package:rest_api_movies/models/movie.dart';

abstract class RecommendState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RecommendInitialState extends RecommendState{}

class RecommendLoadingState extends RecommendState{}

class RecommendLoadedState extends RecommendState{
  final Movie movie;

  RecommendLoadedState({required this.movie});

  @override
  // TODO: implement props
  List<Object?> get props => [movie];
}

class RecommendFailureState extends RecommendState{}