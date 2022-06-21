import 'package:flutter_bloc/flutter_bloc.dart';

import 'item_event.dart';
import 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState>{
  ItemBloc(): super(ItemInitialState()){
    on<OnSelectItem>((event, emit){
      emit(ItemLoadingState());
      emit(ItemLoadedState(item: event.item));
    });
  }
}