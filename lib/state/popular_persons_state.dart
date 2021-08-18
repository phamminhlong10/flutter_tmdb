import 'package:equatable/equatable.dart';
import 'package:rest_api_movies/models/person.dart';

abstract class PopularPersonsState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PopularPersonsInitialState extends PopularPersonsState{
}

class PopularPersonsLoadingState extends PopularPersonsState{}

class PopularPersonsLoadedState extends PopularPersonsState{
  final List<Person> popularPersons;

  PopularPersonsLoadedState({required this.popularPersons});

  @override
  // TODO: implement props
  List<Object?> get props => [popularPersons];
}

class PopularPersonsFailureState extends PopularPersonsState{}