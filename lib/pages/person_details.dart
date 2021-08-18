import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_movies/blocs/details_person_bloc.dart';
import 'package:rest_api_movies/events/details_person_event.dart';
import 'package:rest_api_movies/state/person_details_state.dart';
import 'package:rest_api_movies/widgets/details_person/about_person.dart';
import 'package:rest_api_movies/widgets/details_person/list_participate.dart';

class PersonDetails extends StatelessWidget {
  final int id;
  const PersonDetails({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsPersonBloc()..add(DetailsPersonEvent(id: id)),
      child: Scaffold(
          body: SingleChildScrollView(
            child: BlocBuilder<DetailsPersonBloc, DetailsPersonState>(
              builder: (context, state) {
                if(state is DetailsPersonLoadedState){
                  return Column(
                    children: [
                      AboutPerson(person: state.person),
                      ListParticipate(movies: state.movies)
                    ],
                  );
                }
                return Text("Failed");
              },
            ),
          )
        ),
    );
  }
}
