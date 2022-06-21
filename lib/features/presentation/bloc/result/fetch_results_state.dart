import 'package:equatable/equatable.dart';

import '../../../domain/entities/result.dart';

abstract class FetchState extends Equatable{
  @override
  List<Object> get props => [];
}

class Initial extends FetchState{}

class Loading extends FetchState{}

class Success extends FetchState{
  final List<Result> result;
  Success({required this.result});

  @override
  List<Object> get props => [result];
}

class Error extends FetchState{
  final String? message;
  Error({this.message});
}