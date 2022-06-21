

import '../../domain/entities/cast.dart';

class CastModel extends Cast{
  CastModel({
    bool? adult,
    int? gender,
    required int id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    double? popularity,
    String? profilePath,
    int? castId,
    String? character,
    String? creditId,
    int? order,
}) : super(
    id: id,
    profilePath: profilePath,
    name: name,
    popularity: popularity,
    adult: adult,
    originalName: originalName,
    castId: castId,
    character: character,
    creditId: creditId,
    gender: gender,
    knownForDepartment: knownForDepartment,
    order: order
  );

  factory CastModel.fromJson(Map<String, dynamic> json){
    return CastModel(
      adult : json['adult'],
      gender : json['gender'],
      id : json['id'],
      knownForDepartment : json['known_for_department'],
      name : json['name'],
      originalName : json['original_name'],
      popularity : json['popularity'],
      profilePath : json['profile_path'],
      castId : json['cast_id'],
      character : json['character'],
      creditId : json['credit_id'],
      order : json['order'],
    );
  }
}