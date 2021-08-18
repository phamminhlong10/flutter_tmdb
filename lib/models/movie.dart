import 'package:equatable/equatable.dart';

class Movie extends Equatable{
  final int id;
  final String? title;
  final String? overview;
  final String? poster;
  final String? releaseDay;
  final double? voteAverage;
  final int? voteCount;
  final String? tvName;
  final String? firstAirDate;
  final String mediaType;

  Movie({required this.id, this.title, this.overview, this.poster,
    this.releaseDay, this.voteAverage, this.voteCount, this.tvName,
    this.firstAirDate, required this.mediaType});


  @override
  // TODO: implement props
  List<Object?> get props => [id, title, overview, poster, releaseDay, voteAverage, voteCount, tvName, firstAirDate, mediaType];
}