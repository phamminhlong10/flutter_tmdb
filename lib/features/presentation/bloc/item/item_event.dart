
import '../../../domain/entities/result.dart';

abstract class ItemEvent{}

class OnSelectItem extends ItemEvent{
  final Result item;
  OnSelectItem({required this.item});
}