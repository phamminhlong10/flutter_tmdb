import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../routes.dart';
import '../../bloc/item/item_bloc.dart';
import '../../bloc/item/item_event.dart';
import '../../bloc/result/fetch_results_bloc.dart';
import '../../bloc/result/fetch_results_event.dart';
import '../../bloc/result/fetch_results_state.dart';
import '../loading_widget.dart';


class ListItemGrid extends StatelessWidget {
  const ListItemGrid({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<FetchBloc>()..add(FetchParticipated(id: id)),
      builder: (context, state) {
        if (state is Loading) {
          return const LoadingWidget();
        } else if (state is Success){
          return SizedBox(
            height: (state.result.length) % 2 != 0 ? (state.result.length * 340) / 2 + 170 : (state.result.length * 340) / 2,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    mainAxisExtent: 320),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.result.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.read<ItemBloc>().add(OnSelectItem(item: state.result[index]));
                      AppNavigator.push(Routes.itemInfo, state.result[index]);
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            "https://www.themoviedb.org/t/p/w342/${state.result[index].posterPath}",
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          );
        }else if(state is Error){
          return Center(
            child: Text('${state.message}'),
          );
        }
        else {
          return Container();
        }
      });
  }
}
