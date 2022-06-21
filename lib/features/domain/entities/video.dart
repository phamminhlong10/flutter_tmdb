import 'package:equatable/equatable.dart';

class Video extends Equatable {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? publishedAt;
  String id;

  Video(
      {required this.id,
      this.name,
      this.type,
      this.publishedAt,
      this.key,
      this.size,
      this.iso6391,
      this.iso31661,
      this.official,
      this.site});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        type,
        publishedAt,
        key,
        size,
        iso6391,
        iso31661,
        official,
        site
      ];
}
