import 'package:equatable/equatable.dart';

class Provider extends Equatable{
  final int? id;
  final String? nameProvider;
  final String? logoPath;

  Provider({this.id, this.nameProvider, this.logoPath});

  @override
  // TODO: implement props
  List<Object?> get props => [id, nameProvider, logoPath];
}