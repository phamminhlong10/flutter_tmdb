
import 'package:equatable/equatable.dart';

abstract class TrailerEvent extends Equatable{}

class OnPressTrailer extends TrailerEvent{
  final String type;
  final int id;

  OnPressTrailer({required this.type, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [type, id];
}