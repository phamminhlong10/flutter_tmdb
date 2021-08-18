import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_movies/events/details_person_event.dart';
import 'package:rest_api_movies/services/services.dart';
import 'package:rest_api_movies/state/person_details_state.dart';

class DetailsPersonBloc extends Bloc<DetailsPersonEvent, DetailsPersonState>{
  DetailsPersonBloc() : super(DetailsPersonInitialState());

  @override
  Stream<DetailsPersonState> mapEventToState(DetailsPersonEvent event) async*{
    // TODO: implement mapEventToState
    yield DetailsPersonLoadingState();
    try{
      yield DetailsPersonLoadedState(movies: await getParticipated(event.id), person: await getPersonDetails(event.id));
    }catch(_){
      yield DetailsPersonFailureState();
    }
  }
}