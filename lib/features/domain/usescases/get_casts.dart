import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/cast.dart';
import '../repositories/result_repository.dart';
import 'get_similar.dart';

class GetCasts implements UseCase<List<Cast>, TypeAndIdParams>{
  final ResultRepository repository;
  GetCasts({required this.repository});
  @override
  Future<Either<Failure, List<Cast>>> call(TypeAndIdParams params) async{
    return await repository.getCasts(params.type, params.id);
  }
}