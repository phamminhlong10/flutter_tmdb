import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../domain/entities/result.dart';
import '../../bloc/cast/cast_bloc.dart';
import '../../bloc/cast/cast_event.dart';
import '../../bloc/cast/cast_state.dart';
import '../list_person_horizontal.dart';
import '../loading_widget.dart';

class ListCasts extends StatelessWidget {
  const ListCasts({Key? key, required this.result}) : super(key: key);
  final Result result;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CastBloc>(),
      child: BlocBuilder<CastBloc, CastsState>(
        bloc: sl<CastBloc>()..add(FetchCasts(
            id: result.id,
            type: result.releaseDate == null ? 'tv' : 'movie')),
        builder: (context, state) {
          if (state is FetchCastLoading) {
            return const LoadingWidget();
          } else if (state is FetchCastsLoaded) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: Column(
                  children: [
                    Text("Casts",
                        style: Theme.of(context).textTheme.subtitle1),
                    const SizedBox(height: 8),
                    ListPersonHorizontal(casts: state.casts)
                  ]),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
