import 'package:equatable/equatable.dart';

class Cast extends Equatable{
  final int id;
  final String? name;
  final String? profilePath;
  final String? character;
  final int? castId;

  Cast({required this.id, this.name, this.profilePath, this.character, this.castId});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, profilePath, castId, character];
}