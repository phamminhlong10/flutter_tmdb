import 'package:equatable/equatable.dart';

class Person extends Equatable {
  String? birthday;
  String? knownForDepartment;
  String? deathDay;
  int? id;
  String? name;
  int? gender;
  String? biography;
  double? popularity;
  String? placeOfBirth;
  String? profilePath;
  bool? adult;
  String? imdbId;
  String? homepage;

  Person({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.biography,
    this.popularity,
    this.profilePath,
    this.birthday,
    this.placeOfBirth,
    this.imdbId,
    this.homepage,
    this.deathDay,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    adult,
    gender,
    id,
    knownForDepartment,
    name,
    biography,
    popularity,
    profilePath,
    birthday,
    placeOfBirth,
    imdbId,
    homepage,
    deathDay,
      ];
}
