import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_movies/blocs/search_bloc.dart';
import 'package:rest_api_movies/widgets/recommend_movie.dart';
import 'package:rest_api_movies/widgets/popular_persons.dart';
import 'package:rest_api_movies/widgets/popular_tv_shows.dart';
import 'package:rest_api_movies/widgets/popular_movies.dart';
import 'package:rest_api_movies/widgets/search_custom.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FlutterLogo(
          size: 32,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context,
                  delegate: SearchCustom(searchBloc: BlocProvider.of<SearchBloc>(context)));
            },
            color: Theme.of(context).accentColor,
          )
        ],
      ),
      body:SingleChildScrollView(
        child: Container(
              child: Column(
                children: [
                  RecommendMovie(),
                  PopularMovies(),
                  PopularTVShows(),
                  PopularPersons(),
                  //PopularMovies(),
                ],
              )
            ),
      ),
    );
  }
}
