

import 'package:equatable/equatable.dart';

import '../../../domain/entities/video.dart';

abstract class TrailerState extends Equatable{
  @override
  List<Object> get props => [];
}

class TrailerInitial extends TrailerState{}

class TrailerLoading extends TrailerState{}

class TrailerLoaded extends TrailerState{
  final Video trailer;
  TrailerLoaded({required this.trailer});

  @override
  List<Object> get props => [trailer];
}

class TrailerError extends TrailerState{
  final String message;
  TrailerError({required this.message});

  @override
  List<Object> get props => [message];
}