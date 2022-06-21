
abstract class TrailerEvent{}

class OnPressTrailer extends TrailerEvent{
  final String type;
  final int id;

  OnPressTrailer({required this.type, required this.id});
}