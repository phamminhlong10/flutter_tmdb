import 'package:equatable/equatable.dart';

class Result extends Equatable {
  String? posterPath;
  int id;
  String? overview;
  double? voteAverage;
  String? mediaType;
  int? voteCount;
  double? popularity;
  String? backdropPath;
  String? releaseDate;
  String? firstAirDate;
  String? title;
  String? name;
  String? profilePath;

  Result({
    this.backdropPath,
    this.popularity,
    this.overview,
    required this.id,
    this.voteCount,
    this.voteAverage,
    this.posterPath,
    this.mediaType,
    this.title,
    this.name,
    this.releaseDate,
    this.firstAirDate,
    this.profilePath,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        popularity,
        overview,
        id,
        voteCount,
        voteAverage,
        posterPath,
        mediaType,
        title,
        name,
        releaseDate,
        firstAirDate,
        profilePath,
      ];
}
