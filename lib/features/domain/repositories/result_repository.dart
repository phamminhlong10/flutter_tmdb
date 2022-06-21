import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/cast.dart';
import '../entities/person.dart';
import '../entities/result.dart';
import '../entities/video.dart';

abstract class ResultRepository{
  Future<Either<Failure, List<Result>>> getPopular(String type);

  Future<Either<Failure, List<Result>>> getParticipated(int id);

  Future<Either<Failure, List<Result>>> searching(String query);

  Future<Either<Failure, List<Result>>> getSimilar(String type, int id);

  Future<Either<Failure, List<Cast>>> getCasts(String type, int id);

  Future<Either<Failure, Person>> getPerson(int id);

  Future<Either<Failure, List<Video>>> getTrailers(String type, int id);
}