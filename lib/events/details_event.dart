import 'package:equatable/equatable.dart';

abstract class DetailsEvent extends Equatable{
  DetailsEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DetailTabEvent extends DetailsEvent{
  final int id;
  final String mediaType;
  DetailTabEvent({required this.id, required this.mediaType});

  @override
  // TODO: implement props
  List<Object?> get props => [id, mediaType];
}