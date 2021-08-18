import 'package:equatable/equatable.dart';
import 'package:rest_api_movies/models/movie.dart';

abstract class SearchState extends Equatable{
  SearchState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class IsLoadingSearchState extends SearchState{
  final bool? isLoading;
  final List<Movie>? results;
  final bool? hasError;

  IsLoadingSearchState({this.results, this.isLoading = true, this.hasError = false});

  List<Object?> get props => [isLoading, results, hasError];
}

class HasErrorSearchState extends SearchState{
  final bool? isLoading;
  final List<Movie>? results;
  final bool? hasError;

  HasErrorSearchState({this.results, this.isLoading = false, this.hasError = true});

  List<Object?> get props => [isLoading, results, hasError];
}

class SuccessSearchState extends SearchState{
  final bool? isLoading;
  final List<Movie>? results;
  final bool? hasError;

  SuccessSearchState({this.results, this.isLoading = false, this.hasError = false});

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, results, hasError];
}

class InitialSearchState extends SearchState{
}