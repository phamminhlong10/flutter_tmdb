import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_movies/events/popular_tvShows_event.dart';

import 'package:rest_api_movies/services/services.dart';
import 'package:rest_api_movies/state/popular_tvShows_state.dart';

class PopularTVShowBloc extends Bloc<PopularTVShowsEvent, PopularTVShowsState>{
  PopularTVShowBloc(): super(PopularTVShowsInitialState());

  @override
  Stream<PopularTVShowsState> mapEventToState(PopularTVShowsEvent event) async*{
    // TODO: implement mapEventToState
    if(event is FetchPopularTVShowsEvent){
      try{
        yield PopularTVShowsSuccessState(movies: await getPopularTVShows());
      }catch(_){
        yield PopularTVShowsFailureState();
      }
    }else{
      yield PopularTVShowsInitialState();
    }
  }
}