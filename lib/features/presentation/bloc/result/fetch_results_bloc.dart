import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';

import '../../../domain/entities/result.dart';
import '../../../../../core/error/failure.dart';
import '../../../domain/usescases/get_result.dart';
import '../../../domain/usescases/get_similar.dart';
import '../../../domain/usescases/searching.dart';
import 'fetch_results_event.dart';
import 'fetch_results_state.dart';

class FetchBloc extends Bloc<FetchEvent, FetchState> {
  final GetResult getResult;
  final GetSimilar getSimilar;
  final Searching getSearching;
  final GetParticipated getParticipated;
  FetchBloc({required GetResult result, required GetSimilar similar, required Searching searching, required GetParticipated participated})
      : getResult = result,
        getSimilar = similar,
        getSearching = searching,
        getParticipated = participated,
        super(Initial()) {
    on<FetchResults>((event, emit) async {
      emit(Loading());
      emit(_eitherSuccessOrErrorState(
          await getResult.call(Params(type: event.type))));
    });

    on<FetchSimilar>((event, emit) async {
      emit(Loading());
      emit(_eitherSuccessOrErrorState(await getSimilar
          .call(TypeAndIdParams(type: event.type, id: event.id))));
    });

    on<FetchSearching>((event, emit) async{
      emit(Loading());
      emit(_eitherSuccessOrErrorState(await searching.call(Query(event.query))));
    });

    on<FetchParticipated>((event, emit) async{
      emit(Loading());
      emit(_eitherSuccessOrErrorState(await getParticipated.call(event.id)));
    });
  }

  FetchState _eitherSuccessOrErrorState(
      Either<Failure, List<Result>> failureOrSuccess) {
    return failureOrSuccess.fold(
        (failure) => Error(message: failure.runtimeType.toString()),
        (results) => Success(result: results));
  }
}
