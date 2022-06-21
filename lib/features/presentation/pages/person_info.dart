import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/person.dart';
import '../bloc/person/person_bloc.dart';
import '../bloc/person/person_event.dart';
import '../bloc/person/person_state.dart';
import '../widgets/person_info/list_item_grid.dart';
import '../widgets/person_info/person_about.dart';

class PersonInfo extends StatelessWidget {
  const PersonInfo({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PersonAbout(id: id),
            ListItemGrid(id: id)
          ],
        ),
      ),
    );
  }
}
