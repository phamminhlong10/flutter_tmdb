import 'package:equatable/equatable.dart';

import '../../../domain/entities/cast.dart';

abstract class CastsState extends Equatable{
  @override
  List<Object> get props => [];
}

class FetchCastsInitial extends CastsState{
}

class FetchCastLoading extends CastsState{
}

class FetchCastsLoaded extends CastsState{
  final List<Cast> casts;
  FetchCastsLoaded({required this.casts});

  @override
  List<Object> get props => [casts];
}

class FetchCastError extends CastsState{
  final String message;
  FetchCastError({required this.message});

  @override
  List<Object> get props => [message];
}