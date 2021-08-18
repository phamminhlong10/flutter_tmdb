import 'package:equatable/equatable.dart';

abstract class OriginalImageState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class OriginalImageInitialState extends OriginalImageState{
}

class OriginalImageLoadingState extends OriginalImageState{}

class OriginalImageLoadedState extends OriginalImageState{
  final String? path;

  OriginalImageLoadedState({this.path});

  @override
  // TODO: implement props
  List<Object?> get props => [path];
}

class OriginalImageFailureState extends OriginalImageState{}