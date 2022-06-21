abstract class CastsEvent{}

class FetchCasts extends CastsEvent{
  final String type;
  final int id;

  FetchCasts({required this.id, required this.type});
}