import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/result.dart';
import '../repositories/result_repository.dart';


class GetResult implements UseCase<List<Result>, Params>{
  final ResultRepository repository;
  GetResult({required this.repository});

  @override
  Future<Either<Failure, List<Result>>> call(Params params){
    return repository.getPopular(params.type);
  }
}

class GetParticipated implements UseCase<List<Result>, int>{
  final ResultRepository repository;
  GetParticipated({required this.repository});

  @override
  Future<Either<Failure, List<Result>>> call(int id) async{
    // TODO: implement call
    return repository.getParticipated(id);
  }


}


class Params extends Equatable{
  final String type;
  const Params({required this.type});

  @override
  // TODO: implement props
  List<Object?> get props => [type];


}