import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnChangeQuerySearchEvent extends SearchEvent{
  final String query;

  OnChangeQuerySearchEvent({required this.query});

  @override
  // TODO: implement props
  List<Object?> get props => [query];
}