import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_movies/models/cast.dart';
import 'package:rest_api_movies/models/image.dart';

import 'package:rest_api_movies/models/movie.dart';
import 'package:rest_api_movies/models/person.dart';
import 'package:rest_api_movies/models/provider.dart';

final key = "b685d863a3ef285dd17ba8416d1e397f";

Future<List<Movie>> getListPopular() async{
  final url = Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=$key&language=en-US&page=1");
  final response = await http.get(url);
  try{
    if(response.statusCode == 200){
      final responseData = json.decode(response.body);
      final results = await responseData["results"] as List;
      final List<Movie> popular = results.map((e){
          return Movie(
            id: e["id"],
            title: e["title"],
            releaseDay: e["releaseDay"],
            poster: e["poster_path"],
            mediaType: "movie"
          );
      }).toList();
      return popular;
    }
  }catch(_){
    print('Exception sending api : '+_.toString());
    return <Movie>[];
  }
  return <Movie>[];
}


Future<List<Movie>> getPopularTVShows() async{
  final url = Uri.parse("https://api.themoviedb.org/3/tv/popular?api_key=$key&language=en-US&page=1");
  final response = await http.get(url);
  try{
    if(response.statusCode == 200){
      final responseData = json.decode(response.body);
      final results = await responseData["results"] as List;
      final List<Movie> popular = results.map((e){
        return Movie(
          id: e["id"],
          title: e["title"],
          releaseDay: e["releaseDay"],
          poster: e["poster_path"],
          mediaType: "tv"
        );
      }).toList();
      return popular;
    }
  }catch(_){
    print('Exception sending api : '+_.toString());
    return <Movie>[];
  }
  return <Movie>[];
}



Future<List<String>> getUpComing() async{
  final url = Uri.parse(
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$key&language=en-US&page=1");
  final response = await http.get(url);
  try{
    if(response.statusCode == 200){
      final responseData = jsonDecode(response.body);
      final results = responseData["results"] as List;
      final List<String> listTopRated = [];
      results.forEach((element) {
        listTopRated.add(
          element["backdrop_path"]
        );
      });
      return listTopRated;
    }
  }catch(_){
    return <String>[];
  }
  return <String>[];
}

Future<String> getTrailer(int id, String mediaType) async{
  final url = Uri.parse("https://api.themoviedb.org/3/$mediaType/$id/videos?api_key=$key&language=en-US");
  final response = await http.get(url);
  try{
    if(response.statusCode == 200){
      final responseData = jsonDecode(response.body);
      final results = responseData["results"] as List;
      String? key;
      results.forEach((element) {
        if(element["type"] == "Trailer"){
          key = element["key"];
        }
      });
      return "https://www.youtube.com/watch?v=$key";
    }
  }catch(_){
    print(_);
  }
  return "https://www.youtube.com/watch?v=null";
}

Future<Movie> getDetails(int id, String mediaType) async {
  final url = Uri.parse(
      "https://api.themoviedb.org/3/$mediaType/$id?api_key=$key&language=en-US");
  final response = await http.get(url);
  try{
    if(response.statusCode == 200){
      final responseData = jsonDecode(response.body);
      return Movie(
          id: responseData["id"],
          title: responseData["title"],
          releaseDay: responseData["release_date"],
          overview: responseData["overview"],
          poster: responseData["poster_path"],
          voteCount: responseData["vote_count"],
          voteAverage: responseData["vote_average"],
          tvName: responseData["name"],
          firstAirDate: responseData["first_air_date"],
          mediaType: mediaType
      );
    }
  }catch(_){}
  return Movie(id: id, mediaType: mediaType);
}

Future<List<MediaImage>> getListImage(int id, String mediaType) async{
  final url = Uri.parse(
      "https://api.themoviedb.org/3/$mediaType/$id/images?api_key=$key");
  final response = await http.get(url);
  try{
    if(response.statusCode == 200){
      final responseData = jsonDecode(response.body);
      final results = responseData["backdrops"] as List;
      List<MediaImage> listImages = results.map((e){
        return MediaImage(
            path: e["file_path"]
        );
      }).toList();
      return listImages;
    }
  }catch(_){
    print('Exception sending api : '+_.toString());
    return <MediaImage>[];
  }
  return <MediaImage>[];
}

Future<List<Provider>> getProviders(int id, String mediaType) async{
  final url = Uri.parse("https://api.themoviedb.org/3/$mediaType/$id/watch/providers?api_key=$key");
  final response = await http.get(url);
  try{
    if(response.statusCode==200){
      final responseData = jsonDecode(response.body);
      final results = responseData["results"]["US"]["flatrate"] as List;
      print(results);
      List<Provider> watchProviders = results.map((e){
        return Provider(
          nameProvider: e["provider_name"],
          logoPath: e["logo_path"],
          id: e["provider_id"],
        );
      }).toList();
      return watchProviders;
    }
  }catch(_){
    print('Exception sending api : '+_.toString());
    return <Provider>[];
  }

  return <Provider>[];
}

Future<List<Person>> getPersonPopular() async{
  final url = Uri.parse("https://api.themoviedb.org/3/person/popular?api_key=$key&language=en-US&page=1");
  final response =await http.get(url);
  try{
    if(response.statusCode == 200){
      final responseData = jsonDecode(response.body);
      final results = responseData["results"] as List;
      List<Person> popularPersons = results.map((e){
        return Person(
            id: e["id"],
            name: e["name"],
            profilePath: e["profile_path"]
        );
      }).toList();
      return popularPersons;
    }
  }catch(_){
    return <Person>[];
  }
  return <Person>[];
}

Future<Movie> getRecommendMovie() async{
  final request = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=$key&language=en-US&page=1"));
  final dataRequest = jsonDecode(request.body)["results"] as List;
  int idDefault = 0;
  for(int i=0;i<1;i++){
    idDefault = dataRequest[i]["id"];
  }

  final url = Uri.parse(
      "https://api.themoviedb.org/3/movie/$idDefault/recommendations?api_key=$key&language=en-US"
  );
  final response = await http.get(url);
  try{
    if(response.statusCode == 200){
      final responseData = jsonDecode(response.body);
      final result = responseData["results"] as List;
      for(int i =0; i<1; i++){
        return Movie(
            id: result[i]["id"],
            poster: result[i]["poster_path"],
            title: result[i]["title"],
            overview: result[i]["overview"],
            releaseDay: result[i]["release_date"],
            mediaType: result[i]["media_type"],
        );
      }
    }
  }catch(_){
    return Movie(id: 0, mediaType: "movie");
  }
  return Movie(id: 0, mediaType: "movie");
}

Future<Movie> getRecommendTV() async{
  final request = await http.get(Uri.parse("https://api.themoviedb.org/3/tv/popular?api_key=$key&language=en-US&page=1"));
  final dataRequest = jsonDecode(request.body)["results"] as List;
  int idDefault = 0;
  for(int i=0;i<1;i++){
    idDefault = dataRequest[i]["id"];
  }

  final url = Uri.parse(
      "https://api.themoviedb.org/3/tv/$idDefault/recommendations?api_key=$key&language=en-US"
  );
  final response = await http.get(url);
  try{
    if(response.statusCode == 200){
      final responseData = jsonDecode(response.body);
      final result = responseData["results"] as List;
      for(int i =0; i<1; i++){
        return Movie(
            id: result[i]["id"],
            poster: result[i]["poster_path"],
            title: result[i]["title"],
            overview: result[i]["overview"],
            releaseDay: result[i]["release_date"],
            mediaType: result[i]["media_type"],
        );
      }
    }
  }catch(_){
    return Movie(id: 0, mediaType: "tv");
  }
  return Movie(id: 0, mediaType: "tv");
}

Future<List<Cast>> getListCast(int id, String mediaType) async{
  final url = Uri.parse("https://api.themoviedb.org/3/$mediaType/$id/credits?api_key=$key&language=en-US");
  final response = await http.get(url);
  try{
    if(response.statusCode == 200){
      final responseData = jsonDecode(response.body);
      final results = responseData["cast"] as List;
      final List<Cast> listCast = results.map((e){
        return Cast(
            id: e["id"],
            profilePath: e["profile_path"],
            castId: e["cast_id"],
            character: e["character"],
            name: e["name"]
        );
      }).toList();
      return listCast;
    }
  }catch(_){
    return <Cast>[];
  }
  return <Cast>[];
}

Future<List<Movie>> searchMovies (String? query) async{
  final url = Uri.parse(
      "https://api.themoviedb.org/3/search/multi?api_key=$key&language=en-US&page=1&include_adult=false&query=$query");
  final response = await http.get(url);
  try{
    if(response.statusCode == 200){
      final responseData = jsonDecode(response.body);
      final results = responseData["results"] as List;
      final List<Movie> searchResults = results.map((e){
        return Movie(
            id: e["id"],
            mediaType: e["media_type"],
            title: e["original_title"],
            poster: e["poster_path"],
            releaseDay: e["release_date"],
            firstAirDate: e["first_air_date"],
            tvName: e["name"],
            overview: e["overview"],
        );
      }).toList();
      return searchResults;
    }
  }catch(_){
    return <Movie>[];
  }
  return <Movie>[];
}

Future<Person> getPersonDetails(int id)async {
  final url = Uri.parse("https://api.themoviedb.org/3/person/$id?api_key=$key&language=en-US");
  final response = await http.get(url);

  try{
    if(response.statusCode == 200){
      final responseData = jsonDecode(response.body);
      return Person(
          id: responseData["id"],
          name: responseData["name"],
          profilePath: responseData["profile_path"],
          biography: responseData["biography"],
          birthday: responseData["birthday"]
      );
    }
  }catch(_){
    return Person(id: 0, name: "null");
  }
  return Person(id: 0, name: "null");
}

Future<List<Movie>> getParticipated(int id) async{
  final movie = Uri.parse("https://api.themoviedb.org/3/person/$id/movie_credits?api_key=$key&language=en-US");
  final tv = Uri.parse("https://api.themoviedb.org/3/person/$id/tv_credits?api_key=$key&language=en-US");

  final responseMovie = await http.get(movie);
  final responseTV = await http.get(tv);

  try{
    if(responseTV.statusCode == 200 && responseMovie.statusCode == 200){
      final responseDataMovies = jsonDecode(responseMovie.body)["cast"] as List;
      final responseDataTV = jsonDecode(responseTV.body)["cast"] as List;
      List<Movie> listParticipated = [];

      responseDataMovies.forEach((e){
        listParticipated.add(
          Movie(
            id: e["id"],
            mediaType: "movie",
            overview: e["overview"],
            releaseDay: e["release_date"],
            poster: e["poster_path"],
            title: e["title"])
        );
      });

      responseDataTV.forEach((e){
        listParticipated.add(
            Movie(
              id: e["id"],
              mediaType: "tv",
              overview: e["overview"],
              releaseDay: e["release_date"],
              poster: e["poster_path"],
              title: e["title"],
              tvName: e["name"],
              firstAirDate: e["first_air_date"])
        );
      });
      return listParticipated;
    }
  }catch(_){
    return <Movie>[];
  }
  return <Movie>[];
}
