

import '../../domain/entities/video.dart';

class VideoModel extends Video {
  VideoModel({
    String? iso6391,
    String? iso31661,
    String? name,
    String? key,
    String? site,
    int? size,
    String? type,
    bool? official,
    String? publishedAt,
    required String id,
  }) : super(
            id: id,
            name: name,
            type: type,
            iso31661: iso31661,
            iso6391: iso6391,
            key: key,
            official: official,
            publishedAt: publishedAt,
            site: site,
            size: size);

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      iso6391: json['iso_639_1'],
      iso31661: json['iso_3166_1'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
      official: json['official'],
      publishedAt: json['published_at'],
      id: json['id'],
    );
  }
}
