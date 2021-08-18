import 'package:equatable/equatable.dart';

abstract class TrailerEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OpenTrailerEvent extends TrailerEvent{
  final int id;
  final String mediaType;
  OpenTrailerEvent({required this.id, required this.mediaType});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}