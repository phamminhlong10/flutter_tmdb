import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_movies/events/details_event.dart';
import 'package:rest_api_movies/services/services.dart';
import 'package:rest_api_movies/state/details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState>{
  DetailsBloc() : super(DetailsInitialState());

  @override
  Stream<DetailsState> mapEventToState(DetailsEvent event) async*{
    // TODO: implement mapEventToState
    if(event is DetailTabEvent){
      yield DetailsIsLoadingState();
      yield DetailsLoadedState(movie: await getDetails(event.id, event.mediaType),
        images: await getListImage(event.id, event.mediaType),
        providers: await getProviders(event.id, event.mediaType),
        casts: await getListCast(event.id, event.mediaType),
      );
    }else{
      yield DetailsInitialState();
    }
  }
}