import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/person/person_bloc.dart';
import '../../bloc/person/person_event.dart';
import '../../bloc/person/person_state.dart';
import '../loading_widget.dart';

class PersonAbout extends StatelessWidget {
  const PersonAbout({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: context.read<PersonBloc>()..add(OnSelectPerson(id: id)),
        builder: (context, state) {
          if(state is PersonLoading){
            return const LoadingWidget();
          }else if(state is PersonLoaded){
            return Column(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(80),
                        bottomLeft: Radius.circular(80)),
                    child: Image.network(
                        "https://image.tmdb.org/t/p/w500/${state.person.profilePath}")),
                Text("About cast", style: Theme.of(context).textTheme.headline5),
                const SizedBox(height: 16),
                Text(
                  "${state.person.name}",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  "${state.person.birthday}",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(height: 8),
                Container(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Text(
                      "${state.person.biography}",
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
              ],
            );
          }else if(state is PersonError){
            return Center(child: Text(state.message),);
          }else{
            return Container();
          }
        });
  }
}
