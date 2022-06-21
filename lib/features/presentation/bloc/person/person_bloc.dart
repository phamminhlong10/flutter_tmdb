import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/features/presentation/bloc/person/person_event.dart';
import 'package:rest_api/features/presentation/bloc/person/person_state.dart';
import '../../../../../core/error/failure.dart';
import '../../../domain/entities/person.dart';
import '../../../domain/usescases/get_person.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState>{
  final GetPerson getPerson;
  PersonBloc({required GetPerson person}) : getPerson = person, super(PersonInitial()){
    on<OnSelectPerson>((event, emit) async{
      emit(PersonLoading());
      emit(_eitherSuccessOrErrorState(await getPerson.call(event.id)));
    });
  }

  PersonState _eitherSuccessOrErrorState(
      Either<Failure, Person> failureOrSuccess) {
    return failureOrSuccess.fold(
            (failure) => PersonError(message: failure.runtimeType.toString()),
            (person) => PersonLoaded(person: person));
  }
}