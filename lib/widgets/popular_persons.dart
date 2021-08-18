import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rest_api_movies/blocs/popular_persons_bloc.dart';
import 'package:rest_api_movies/pages/person_details.dart';
import 'package:rest_api_movies/state/popular_persons_state.dart';

class PopularPersons extends StatelessWidget {
  const PopularPersons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularPersonsBloc, PopularPersonsState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("POPULAR PERSON",
                  style: Theme.of(context).textTheme.subtitle1
                ),
                Flexible(
                  child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index){
                          if(state is PopularPersonsLoadedState){
                            return GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                                return PersonDetails(id: state.popularPersons[index].id);
                              })),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 8, 0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      foregroundImage: NetworkImage("https://www.themoviedb.org/t/p/original/${state.popularPersons[index].profilePath}"),
                                      radius: 64,
                                      backgroundColor: Colors.grey[100],
                                    ),
                                    SizedBox(height: 16.0),
                                    Text("${state.popularPersons[index].name}",
                                      style: Theme.of(context).textTheme.subtitle2
                                    )
                                  ],
                                ),
                              ),
                            );
                          }else if(state is PopularPersonsFailureState){
                            return Text("Failed to connect to server");
                          }
                          return SpinKitFadingCircle(
                            size: 64.0,
                            color: Theme.of(context).accentColor,
                          );
                        }),
                ),
              ],
            ),
          );
      },
    );
  }
}
