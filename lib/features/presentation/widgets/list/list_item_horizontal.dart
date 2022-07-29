import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/routes.dart';

import '../../../domain/entities/result.dart';
import '../../bloc/item/item_bloc.dart';
import '../../bloc/item/item_event.dart';

class ListItemHorizontal extends StatelessWidget {
  const ListItemHorizontal({Key? key, this.list, this.isReplaceWith}) : super(key: key);
  final List<Result>? list;
  final bool? isReplaceWith;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list?.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      //BlocProvider.of<ItemBloc>(context).add(OnPressItem(item: list![index]));
                      context.read<ItemBloc>().add(OnSelectItem(item: list![index]));
                      if(isReplaceWith == true){
                        AppNavigator.replaceWith(Routes.itemInfo, list![index]);
                      }else{
                        AppNavigator.push(Routes.itemInfo, list![index]);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Hero(
                              tag: 'horizontal-hero-${list![index].id}',
                              child: Image.network(
                                "https://image.tmdb.org/t/p/w500/${list![index].posterPath}",
                                width: 150,
                                height: 225,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
