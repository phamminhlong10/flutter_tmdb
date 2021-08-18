import 'package:equatable/equatable.dart';
import 'package:rest_api_movies/models/cast.dart';
import 'package:rest_api_movies/models/image.dart';
import 'package:rest_api_movies/models/movie.dart';
import 'package:rest_api_movies/models/provider.dart';

abstract class DetailsState extends Equatable{
  DetailsState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DetailsInitialState extends DetailsState{}
class DetailsIsLoadingState extends DetailsState{}
class DetailsLoadedState extends DetailsState{
  final Movie movie;
  final List<Provider>? providers;
  final List<MediaImage>? images;
  final List<Cast>? casts;
  DetailsLoadedState({required this.movie, this.providers, this.images, this.casts});

  @override
  // TODO: implement props
  List<Object?> get props => [movie, providers, images, casts];
}