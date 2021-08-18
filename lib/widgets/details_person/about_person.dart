import 'package:flutter/material.dart';
import 'package:rest_api_movies/models/movie.dart';
import 'package:rest_api_movies/models/person.dart';

class AboutPerson extends StatelessWidget {
  final Person person;
  const AboutPerson({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(80), bottomLeft: Radius.circular(80)),
              child: Image.network("https://www.themoviedb.org/t/p/original/${person.profilePath}")),
          Text("About cast", style: Theme.of(context).textTheme.headline5),
          SizedBox(height: 16),
          Text(person.name, style: Theme.of(context).textTheme.subtitle1,),
          Text("${person.birthday}", style: Theme.of(context).textTheme.subtitle2,),
          SizedBox(height: 8),
          Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Text("${person.biography}", style: Theme.of(context).textTheme.bodyText1,)),
        ],
      ),
    );
  }
}
