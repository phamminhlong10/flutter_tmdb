import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/result.dart';
import '../repositories/result_repository.dart';
import 'get_result.dart';

class Searching implements UseCase<List<Result>, Query>{
  final ResultRepository repository;
  Searching({required this.repository});

  @override
  Future<Either<Failure, List<Result>>> call(Query query) async{
    return await repository.searching(query.query ?? '');
  }
}

class Query extends Equatable{
  final String? query;
  const Query(this.query);

  @override
  // TODO: implement props
  List<Object?> get props => [query];


}