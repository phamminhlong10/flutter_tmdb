import 'package:flutter/material.dart';
import 'package:rest_api_movies/models/cast.dart';
import 'package:rest_api_movies/pages/person_details.dart';

class ListCast extends StatelessWidget {
  final List<Cast>? casts;
  const ListCast({Key? key, this.casts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
      child: Column(
        children: [
          Text("CAST",
              style: Theme.of(context).textTheme.subtitle1
          ),
          SizedBox(height: 16),
          Flexible(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: casts!.length > 15 ? 15 : casts!.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                    return PersonDetails(id: casts![index].id);
                  })),
                  child: Container(
                    padding: EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                        CircleAvatar(
                          foregroundImage: NetworkImage(
                            "https://www.themoviedb.org/t/p/original/${casts![index].profilePath}"
                          ),
                          radius: 64,
                          backgroundColor: Colors.grey[100],
                        ),
                        SizedBox(height: 16.0),
                        Text("${casts![index].name}",
                            style: Theme.of(context).textTheme.subtitle2
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
