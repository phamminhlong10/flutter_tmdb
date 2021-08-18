import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_movies/events/popular_persons.dart';
import 'package:rest_api_movies/services/services.dart';
import 'package:rest_api_movies/state/popular_persons_state.dart';

class PopularPersonsBloc extends Bloc<PopularPersonEvent, PopularPersonsState>{
  PopularPersonsBloc(): super(PopularPersonsInitialState());

  @override
  Stream<PopularPersonsState> mapEventToState(PopularPersonEvent event) async*{
    // TODO: implement mapEventToState
      if(event is FetchPopularPersonEvent){
        try{
          yield PopularPersonsLoadingState();
          yield PopularPersonsLoadedState(popularPersons: await getPersonPopular());
        }catch(_){
          yield PopularPersonsFailureState();
        }
      }

  }
}