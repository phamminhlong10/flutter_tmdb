import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/person.dart';
import '../repositories/result_repository.dart';

class GetPerson implements UseCase<Person, int>{
  final ResultRepository repository;
  GetPerson({required this.repository});

  @override
  Future<Either<Failure, Person>> call(id) async{
    return await repository.getPerson(id);
  }
}