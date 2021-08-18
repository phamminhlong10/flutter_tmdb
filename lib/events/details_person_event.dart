import 'package:equatable/equatable.dart';

class DetailsPersonEvent extends Equatable{
  final int id;

  DetailsPersonEvent({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [id];
}