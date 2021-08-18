import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_movies/events/recommend_event.dart';
import 'package:rest_api_movies/services/services.dart';
import 'package:rest_api_movies/state/recommend_state.dart';

class RecommendBloc extends Bloc<RecommendEvent, RecommendState>{
  RecommendBloc() : super(RecommendInitialState());

  @override
  Stream<RecommendState> mapEventToState(RecommendEvent event) async*{
    // TODO: implement mapEventToState
    if(event is FetchRecommendEvent){
      try{
        yield RecommendLoadingState();
        yield RecommendLoadedState(movie: DateTime.now().day % 2 == 0 ? await getRecommendMovie() : await getRecommendTV());
      }catch(_){
        yield RecommendFailureState();
      }
    }
  }
}