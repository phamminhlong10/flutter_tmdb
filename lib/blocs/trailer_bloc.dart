import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_movies/events/trailer_event.dart';
import 'package:rest_api_movies/repository/launchURL.dart';
import 'package:rest_api_movies/services/services.dart';
import 'package:rest_api_movies/state/trailer_state.dart';

class TrailerBloc extends Bloc<TrailerEvent, TrailerState>{
  final LaunchURL _launchURL;
  TrailerBloc({required LaunchURL launchURL}) : _launchURL = launchURL ,super(TrailerInitialState());

  @override
  Stream<TrailerState> mapEventToState(TrailerEvent event) async*{
    // TODO: implement mapEventToState
    if(event is OpenTrailerEvent){
      try{
        _launchURL.openURL(await getTrailer(event.id, event.mediaType));
        yield TrailerOpenedState(url: await getTrailer(event.id, event.mediaType));
      }catch(_){
        yield TrailerFailureState();
      }
    }else{
      yield TrailerInitialState();
    }
  }
}