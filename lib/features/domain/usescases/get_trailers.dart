import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/video.dart';
import '../repositories/result_repository.dart';
import 'get_similar.dart';

class GetTrailers implements UseCase<List<Video>, TypeAndIdParams> {
  final ResultRepository repository;
  GetTrailers({required this.repository});

  @override
  Future<Either<Failure, List<Video>>> call(TypeAndIdParams params) async {
    return await repository.getTrailers(params.type, params.id);
  }
}
