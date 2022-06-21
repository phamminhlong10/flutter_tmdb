import 'package:equatable/equatable.dart';

abstract class PersonEvent extends Equatable{}

class OnSelectPerson extends PersonEvent{
  final int id;
  OnSelectPerson({required this.id});

  @override
  List<Object?> get props => [id];
}