import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/error/failure.dart';
import '../models/result_model.dart';
abstract class LocalDataSource{
  Future<List<ResultModel>> getLastPopularResults();
  Future<void> cacheResults(List<ResultModel> resultModel);
}

const POPULAR_CACHED_RESULTS = 'POPULAR_CACHED_RESULTS';

class LocalDataSourceImp implements LocalDataSource{
  final SharedPreferences sharedPreferences;
  
  LocalDataSourceImp({required this.sharedPreferences});
  
  @override
  Future<void> cacheResults(List<ResultModel> resultModel) {
    return sharedPreferences.setString(POPULAR_CACHED_RESULTS, jsonEncode(resultModel.map((e) => e.toJson()).toList()));
  }

  @override
  Future<List<ResultModel>> getLastPopularResults() {
    final jsonString = sharedPreferences.getString(POPULAR_CACHED_RESULTS);
    if(jsonString != null){
      return Future.value((jsonDecode(jsonString) as List).map((e) => ResultModel.fromJson(e)).toList());
    }else{
      throw CacheFailure();
    }
  }
  
}