

import '../../domain/entities/person.dart';

class PersonModel extends Person {
  PersonModel({
    String? birthday,
    String? knownForDepartment,
    String? deathDay,
    int? id,
    String? name,
    int? gender,
    String? biography,
    double? popularity,
    String? placeOfBirth,
    String? profilePath,
    bool? adult,
    String? imdbId,
    String? homepage,
  }) : super(
            id: id,
            knownForDepartment: knownForDepartment,
            gender: gender,
            adult: adult,
            popularity: popularity,
            name: name,
            profilePath: profilePath,
            homepage: homepage,
            imdbId: imdbId,
            biography: biography,
            birthday: birthday,
            deathDay: deathDay,
            placeOfBirth: placeOfBirth);

  factory PersonModel.fromJson(Map<String, dynamic> json){
    return PersonModel(
      birthday : json['birthday'],
      knownForDepartment : json['known_for_department'],
      deathDay : json['deathday'],
      id : json['id'],
      name : json['name'],
      gender : json['gender'],
      biography : json['biography'],
      popularity : json['popularity'],
      placeOfBirth : json['place_of_birth'],
      profilePath : json['profile_path'],
      adult : json['adult'],
      imdbId : json['imdb_id'],
      homepage : json['homepage'],
    );
  }
}
