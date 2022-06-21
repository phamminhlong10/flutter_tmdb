import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/entities/cast.dart';
import '../../../domain/usescases/get_casts.dart';
import '../../../domain/usescases/get_similar.dart';
import 'cast_event.dart';
import 'cast_state.dart';

class CastBloc extends Bloc<CastsEvent, CastsState>{
  final GetCasts getCasts;
  CastBloc({required GetCasts casts}) : getCasts = casts, super(FetchCastsInitial()){
    on<FetchCasts>((event, emit) async{
      emit(FetchCastLoading());
      emit(_eitherSuccessOrErrorState(await getCasts.call(TypeAndIdParams(type: event.type, id: event.id))));
    });
  }
  CastsState _eitherSuccessOrErrorState(
      Either<Failure, List<Cast>> failureOrSuccess) {
    return failureOrSuccess.fold(
            (failure) => FetchCastError(message: failure.runtimeType.toString()),
            (casts) => FetchCastsLoaded(casts: casts));
  }
}