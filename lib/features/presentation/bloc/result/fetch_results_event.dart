abstract class FetchEvent{}

class FetchResults extends FetchEvent{
  String type;
  FetchResults({required this.type});
}

class FetchSimilar extends FetchEvent {
  final String type;
  final int id;

  FetchSimilar({required this.id, required this.type});
}

class FetchSearching extends FetchEvent{
  final String? query;
  FetchSearching({this.query});
}

class FetchParticipated extends FetchEvent{
  final int id;
  FetchParticipated({required this.id});
}