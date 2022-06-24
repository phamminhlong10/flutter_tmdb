import 'package:equatable/equatable.dart';

abstract class FetchEvent extends Equatable{}

class FetchResults extends FetchEvent{
  String type;
  FetchResults({required this.type});

  @override
  List<Object?> get props => [type];
}

class FetchSimilar extends FetchEvent {
  final String type;
  final int id;

  FetchSimilar({required this.id, required this.type});

  @override
  List<Object?> get props => [type, id];
}

class FetchSearching extends FetchEvent{
  final String? query;
  FetchSearching({this.query});

  @override
  List<Object?> get props => [query];
}

class FetchParticipated extends FetchEvent{
  final int id;
  FetchParticipated({required this.id});

  @override
  List<Object?> get props => [id];
}