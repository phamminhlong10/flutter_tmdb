import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_movies/events/original_image_event.dart';
import 'package:rest_api_movies/state/original_image_state.dart';

class OriginalImageBloc extends Bloc<OriginalImageEvent, OriginalImageState>{
  OriginalImageBloc() : super(OriginalImageInitialState());

  @override
  Stream<OriginalImageState> mapEventToState(OriginalImageEvent event) async*{
    // TODO: implement mapEventToState
    if(event is ClickToShowOriginalImageEvent){
      try{
        yield OriginalImageLoadingState();
        yield OriginalImageLoadedState(path: event.path);
      }catch(_){
        yield OriginalImageFailureState();
      }
    }else{
      yield OriginalImageInitialState();
    }
  }
}