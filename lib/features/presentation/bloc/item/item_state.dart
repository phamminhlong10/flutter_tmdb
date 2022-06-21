import 'package:equatable/equatable.dart';

import '../../../domain/entities/result.dart';

abstract class ItemState extends Equatable{
  @override
  List<Object> get props => [];
}

class ItemInitialState extends ItemState{}

class ItemLoadingState extends ItemState{}

class ItemLoadedState extends ItemState{
  final Result item;
  ItemLoadedState({required this.item});

  @override
  List<Object> get props => [item];
}