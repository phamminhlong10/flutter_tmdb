import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_movies/events/popular_movies_event.dart';
import 'package:rest_api_movies/services/services.dart';
import 'package:rest_api_movies/state/popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState>{
  PopularMoviesBloc() : super(PopularMoviesInitialState());

  @override
  Stream<PopularMoviesState> mapEventToState(PopularMoviesEvent event) async*{
    // TODO: implement mapEventToState
    if(event is FetchPopularMoviesEvent){
      try{
        yield PopularMoviesSuccessState(movies: await getListPopular());
      }catch(_){
        yield PopularMoviesFailureState();
      }
    }else{
      yield PopularMoviesInitialState();
    }
  }
}