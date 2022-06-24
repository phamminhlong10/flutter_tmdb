import 'package:equatable/equatable.dart';

abstract class CastsEvent extends Equatable{}

class FetchCasts extends CastsEvent{
  final String type;
  final int id;

  FetchCasts({required this.id, required this.type});

  @override
  // TODO: implement props
  List<Object?> get props => [type, id];
}