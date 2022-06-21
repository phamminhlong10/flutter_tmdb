import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/error/failure.dart';
import '../models/cast_model.dart';
import '../models/person_model.dart';
import '../models/result_model.dart';
import '../models/video_model.dart';


const key = 'b685d863a3ef285dd17ba8416d1e397f';

abstract class RemoteDataSource {
  Future<List<ResultModel>> getPopular(String type);

  Future<List<ResultModel>> getParticipated(int id);

  Future<List<ResultModel>> searching(String query);

  Future<List<ResultModel>> getSimilar(String type, int id);

  Future<List<CastModel>> getCasts(String type, int id);

  Future<PersonModel> getPerson(int id);

  Future<List<VideoModel>> getTrailers(String type, int id);
}

class RemoteDataSourceImp implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImp({required this.client});

  @override
  Future<List<ResultModel>> getPopular(String type) async {
    final response = await client.get(Uri.parse(
        "https://api.themoviedb.org/3/$type/popular?api_key=$key&language=en-US&page=1"));
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final results = await responseData["results"] as List;
      final List<ResultModel> popular =
          results.map((e) => ResultModel.fromJson(e)).toList();
      return popular;
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<List<ResultModel>> getParticipated(int id) async {
    final movie = Uri.parse(
        "https://api.themoviedb.org/3/person/$id/movie_credits?api_key=$key&language=en-US");
    final tv = Uri.parse(
        "https://api.themoviedb.org/3/person/$id/tv_credits?api_key=$key&language=en-US");
    final responseMovie = await http.get(movie);
    final responseTV = await http.get(tv);

    if (responseTV.statusCode == 200 && responseMovie.statusCode == 200) {
      final responseDataMovies = jsonDecode(responseMovie.body)["cast"] as List;
      final responseDataTV = jsonDecode(responseTV.body)["cast"] as List;
      List<ResultModel> results = [];
      for (var element in responseDataMovies) {
        results.add(ResultModel.fromJson(element));
      }
      for (var element in responseDataTV) {
        results.add(ResultModel.fromJson(element));
      }

      return results;
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<List<ResultModel>> searching(String query) async{
    final url = Uri.parse(
        "https://api.themoviedb.org/3/search/multi?api_key=$key&language=en-US&page=1&include_adult=false&query=$query");
    final response = await http.get(url);

    if(response.statusCode == 200){
      final responseData = json.decode(response.body)['results'] as List;
      final List<ResultModel> results =
      responseData.map((e) => ResultModel.fromJson(e)).toList();
      return results;
    }else{
      throw ServerFailure();
    }
  }

  @override
  Future<List<ResultModel>> getSimilar(String type, int id) async{
    final url = Uri.parse(
    "https://api.themoviedb.org/3/$type/$id}/similar?api_key=$key&language=en-US&page=1");
    final response = await http.get(url);

    if(response.statusCode == 200){
      final responseData = json.decode(response.body)['results'] as List;
      final List<ResultModel> results =
      responseData.map((e) => ResultModel.fromJson(e)).toList();
      return results;
    }else{
      throw ServerFailure();
    }
  }

  @override
  Future<List<CastModel>> getCasts(String type, int id) async{
    final url = Uri.parse(
        "https://api.themoviedb.org/3/$type/$id}/credits?api_key=$key&language=en-US");
    final response = await http.get(url);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final cast = await responseData['cast'] as List;
        final List<CastModel> credits = cast.map((e) => CastModel.fromJson(e)).toList();
        return credits;
      }else{
        throw ServerFailure();
    }
  }

  @override
  Future<PersonModel> getPerson(int id) async{
    final url = Uri.parse(
        "https://api.themoviedb.org/3/person/$id?api_key=$key&language=en-US");
    final response = await http.get(url);
    if(response.statusCode == 200){
      final responseData = json.decode(response.body);
      return PersonModel.fromJson(responseData);
    }else{
      throw ServerFailure();
    }
  }

  @override
  Future<List<VideoModel>> getTrailers(String type, int id) async{
    final url = Uri.parse(
        "https://api.themoviedb.org/3/$type/$id/videos?api_key=$key&language=en-US");
    final response = await http.get(url);
    if(response.statusCode == 200){
      final responseData = json.decode(response.body)['results'] as List;
      final List<VideoModel> trailers =
      responseData.map((e) => VideoModel.fromJson(e)).toList();
      return trailers;
    }else{
      throw ServerFailure();
    }
  }
}
