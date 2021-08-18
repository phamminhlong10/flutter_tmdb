import 'package:equatable/equatable.dart';

class Person extends Equatable{
  final int id;
  final String name;
  final String? birthday;
  final String? profilePath;
  final String? biography;


  Person({required this.id, required this.name, this.birthday, this.profilePath, this.biography});
  @override
  // TODO: implement props
  List<Object?> get props => [id, name, birthday, biography, profilePath];
}