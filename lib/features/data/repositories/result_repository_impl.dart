import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/platform/network_info.dart';
import '../../domain/entities/cast.dart';
import '../../domain/entities/person.dart';
import '../../domain/entities/result.dart';
import '../../domain/entities/video.dart';
import '../../domain/repositories/result_repository.dart';
import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';

class ResultRepositoryImpl implements ResultRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ResultRepositoryImpl(
      {required this.networkInfo,
      required this.localDataSource,
      required this.remoteDataSource});

  @override
  Future<Either<Failure,List<Result>>> getPopular(String type) async{
    if(await networkInfo.isConnected){
      try{
        final itemEntities = await remoteDataSource.getPopular(type);
        localDataSource.cacheResults(itemEntities);
        return Right(itemEntities);
      }on ServerFailure{
        throw ServerFailure();
      }
    }else{
      throw ServerFailure();
    }
    // else{
    //  try{
    //    final localData = await localDataSource.getLastPopularResults();
    //    return Right(localData);
    //  }on CacheFailure{
    //    throw CacheFailure();
    //  }
    // }
  }

  @override
  Future<Either<Failure, List<Result>>> getParticipated(int id) async{
      try{
        final item = await remoteDataSource.getParticipated(id);
        return Right(item);
      }on ServerFailure{
        throw ServerFailure();
      }
  }

  @override
  Future<Either<Failure, List<Result>>> searching(String query) async{
      try{
        final results = await remoteDataSource.searching(query);
        return Right(results);
      }on ServerFailure{
        throw ServerFailure();
      }
  }

  @override
  Future<Either<Failure, List<Result>>> getSimilar(String type, int id) async{
    try{
      return Right(await remoteDataSource.getSimilar(type, id));
    }on ServerFailure{
      throw ServerFailure();
    }
  }

  @override
  Future<Either<Failure, List<Cast>>> getCasts(String type, int id) async{
   try{
     return Right(await remoteDataSource.getCasts(type, id));
   }on ServerFailure{
     throw ServerFailure();
   }
  }

  @override
  Future<Either<Failure, Person>> getPerson(int id) async{
    try{
      return Right(await remoteDataSource.getPerson(id));
    }on ServerFailure{
      throw ServerFailure();
    }
  }

  @override
  Future<Either<Failure, List<Video>>> getTrailers(String type, int id) async{
    try{
      return Right(await remoteDataSource.getTrailers(type, id));
    }on ServerFailure{
      throw ServerFailure();
    }
  }
}
