import '../../domain/entities/result.dart';

class ResultModel extends Result {
  ResultModel({
    String? posterPath,
    required int id,
    String? overview,
    double? voteAverage,
    String? mediaType,
    int? voteCount,
    double? popularity,
    String? backdropPath,
    String? releaseDate,
    String? firstAirDate,
    String? title,
    String? name,
    String? profilePath,
  }) : super(
            posterPath: posterPath,
            overview: overview,
            name: name,
            id: id,
            firstAirDate: firstAirDate,
            backdropPath: backdropPath,
            profilePath: profilePath,
            title: title,
            releaseDate: releaseDate,
            mediaType: mediaType,
            voteAverage: voteAverage,
            voteCount: voteCount);

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        popularity: (json['popularity'] != null
            ? double.parse(json['popularity'].toString())
            : null),
        overview: json['overview'],
        posterPath: json['poster_path'],
        voteCount: json['vote_count'],
        voteAverage: (json['vote_average'] != null
            ? double.parse(json['vote_average'].toString())
            : null),
        mediaType: json['media_type'],
        name: json['name'],
        releaseDate: json['release_date'],
        title: json['title'],
        firstAirDate: json['first_air_date'],
        profilePath: json['profile_path']);
  }

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'backdrop_path': backdropPath,
      'popularity': popularity,
      'overview': overview,
      'poster_path': posterPath,
      'vote_count': voteCount,
      'vote_average': voteAverage,
      'media_type': mediaType,
      'name': name,
      'release_date': releaseDate,
      'title': title,
      'first_air_date': firstAirDate,
      'profile_path': profilePath
    };
  }
}
