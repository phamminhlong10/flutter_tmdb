import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/result.dart';
import '../repositories/result_repository.dart';

class GetSimilar implements UseCase<List<Result>, TypeAndIdParams> {
  final ResultRepository repository;
  GetSimilar({required this.repository});
  @override
  Future<Either<Failure, List<Result>>> call(TypeAndIdParams params) async {
    return await repository.getSimilar(params.type, params.id);
  }
}

class TypeAndIdParams extends Equatable {
  final String type;
  final int id;

  const TypeAndIdParams({required this.type, required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [type, id];
}
