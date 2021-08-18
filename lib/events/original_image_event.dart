import 'package:equatable/equatable.dart';

abstract class OriginalImageEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class ClickToShowOriginalImageEvent extends OriginalImageEvent{
  final String? path;

  ClickToShowOriginalImageEvent({this.path});

  @override
  // TODO: implement props
  List<Object?> get props => [path];
}