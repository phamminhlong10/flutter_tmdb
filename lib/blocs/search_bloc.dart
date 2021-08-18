import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_movies/events/search_event.dart';
import 'package:rest_api_movies/services/services.dart';
import 'package:rest_api_movies/state/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState>{
  SearchBloc() : super(InitialSearchState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async*{
    // TODO: implement mapEventToState
    yield IsLoadingSearchState();
    try{
      if(event is OnChangeQuerySearchEvent){
        yield SuccessSearchState(results: await searchMovies(event.query));
      }
    }catch(_){
      yield HasErrorSearchState();
    }
  }
}