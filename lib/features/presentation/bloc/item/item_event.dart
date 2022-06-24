
import 'package:equatable/equatable.dart';

import '../../../domain/entities/result.dart';

abstract class ItemEvent extends Equatable{}

class OnSelectItem extends ItemEvent{
  final Result item;
  OnSelectItem({required this.item});

  @override
  // TODO: implement props
  List<Object?> get props => [item];
}