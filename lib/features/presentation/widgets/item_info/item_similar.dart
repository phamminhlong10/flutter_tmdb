import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../domain/entities/result.dart';
import '../../bloc/result/fetch_results_bloc.dart';
import '../../bloc/result/fetch_results_event.dart';
import '../../bloc/result/fetch_results_state.dart';
import '../list/list_item_horizontal.dart';
import '../loading_widget.dart';

class ItemSimilar extends StatelessWidget {
  const ItemSimilar({Key? key, required this.result}) : super(key: key);
  final Result result;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("SIMILAR MOVIES",
              style: Theme.of(context).textTheme.subtitle1),
          const SizedBox(height: 8),
          BlocProvider(
            create: (context) => sl<FetchBloc>(),
            child: BlocBuilder<FetchBloc, FetchState>(
                bloc: sl<FetchBloc>()..add(FetchSimilar(id: result.id, type: result.firstAirDate == null ? 'movie' : 'tv')),
                builder: (context, state) {
                  if (state is Loading) {
                    return const LoadingWidget();
                  } else if (state is Success) {
                    return ListItemHorizontal(
                      list: state.result,
                      isReplaceWith: true,
                    );
                  } else if (state is Error) {
                    return Center(child: Text('${state.message}'));
                  } else {
                    return Container();
                  }
                }),
          ),
        ],
      ),
    );
  }
}
