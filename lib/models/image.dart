import 'package:equatable/equatable.dart';

class MediaImage extends Equatable{
  final String? path;

  MediaImage({this.path});

  @override
  // TODO: implement props
  List<Object?> get props => [path];
}