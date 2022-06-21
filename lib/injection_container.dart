import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rest_api/features/data/datasources/local_data_source.dart';
import 'package:rest_api/features/data/datasources/remote_data_source.dart';
import 'package:rest_api/features/data/repositories/result_repository_impl.dart';
import 'package:rest_api/features/domain/repositories/result_repository.dart';
import 'package:rest_api/features/domain/usescases/get_casts.dart';
import 'package:rest_api/features/domain/usescases/get_person.dart';
import 'package:rest_api/features/domain/usescases/get_result.dart';
import 'package:rest_api/features/domain/usescases/get_similar.dart';
import 'package:rest_api/features/domain/usescases/get_trailers.dart';
import 'package:rest_api/features/domain/usescases/searching.dart';
import 'package:rest_api/features/presentation/bloc/cast/cast_bloc.dart';
import 'package:rest_api/features/presentation/bloc/item/item_bloc.dart';
import 'package:rest_api/features/presentation/bloc/person/person_bloc.dart';
import 'package:rest_api/features/presentation/bloc/result/fetch_results_bloc.dart';
import 'package:rest_api/features/presentation/bloc/trailer/trailer_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/platform/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async{
  sl.registerFactory(() => FetchBloc(result: sl(), similar: sl(), searching: sl(), participated: sl()));
  sl.registerFactory(() => ItemBloc());
  sl.registerFactory(() => CastBloc(casts: sl()));
  sl.registerFactory(() => PersonBloc(person: sl()));
  sl.registerFactory(() => TrailerBloc(trailers: sl()));

  sl.registerLazySingleton<GetResult>(() => GetResult(repository: sl()));
  sl.registerLazySingleton<GetSimilar>(() => GetSimilar(repository: sl()));
  sl.registerLazySingleton<GetCasts>(() => GetCasts(repository: sl()));
  sl.registerLazySingleton<Searching>(() => Searching(repository: sl()));
  sl.registerLazySingleton<GetPerson>(() => GetPerson(repository: sl()));
  sl.registerLazySingleton<GetParticipated>(() => GetParticipated(repository: sl()));
  sl.registerLazySingleton<GetTrailers>(() => GetTrailers(repository: sl()));

  sl.registerLazySingleton<ResultRepository>(() => ResultRepositoryImpl(networkInfo: sl(), localDataSource: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImp(client: sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImp(sharedPreferences: sl()));
  sl.registerLazySingleton<NetworkInfo>(()  => NetworkInfoImp(sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

