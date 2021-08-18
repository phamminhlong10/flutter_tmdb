import 'package:equatable/equatable.dart';

abstract class TrailerState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TrailerInitialState extends TrailerState{}

class TrailerOpenedState extends TrailerState{
  final String url;
  TrailerOpenedState({required this.url});

  @override
  // TODO: implement props
  List<Object?> get props => [url];
}

class TrailerFailureState extends TrailerState{}