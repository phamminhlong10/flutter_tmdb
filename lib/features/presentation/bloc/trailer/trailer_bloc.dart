import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/features/presentation/bloc/trailer/trailer_event.dart';
import 'package:rest_api/features/presentation/bloc/trailer/trailer_state.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/entities/video.dart';
import '../../../domain/usescases/get_similar.dart';
import '../../../domain/usescases/get_trailers.dart';

class TrailerBloc extends Bloc<TrailerEvent, TrailerState>{
  final GetTrailers getTrailers;
  TrailerBloc({required GetTrailers trailers}) : getTrailers = trailers ,super(TrailerInitial()){
    on<OnPressTrailer>((event, emit) async{
      emit(TrailerLoading());
      emit(_eitherSuccessOrErrorState(await getTrailers.call(TypeAndIdParams(type: event.type, id: event.id))));
    });
  }

  TrailerState _eitherSuccessOrErrorState(
      Either<Failure, List<Video>> failureOrSuccess) {
    return failureOrSuccess.fold(
            (failure) => TrailerError(message: failure.runtimeType.toString()),
            (videos) => TrailerLoaded(trailer: isLatestTrailer(videos)));
  }

  Video isLatestTrailer(List<Video> videos){
    List<Video> trailers = [];
    for(int i =0; i<videos.length; i++) {
      if(videos[i].type == "Trailer"){
        trailers.add(videos[i]);
      }
    }
    Video latest = trailers.elementAt(0);
    if(trailers.length > 1){
      for(int i=0; i<trailers.length - 1; i++){
        if(DateTime.parse(latest.publishedAt ?? '').isBefore(DateTime.parse(trailers[i+1].publishedAt ?? '')) == true){
          latest = trailers[i];
        }
      }
    }
    return latest;
  }
}