

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/routes.dart';

import '../bloc/item/item_bloc.dart';
import '../bloc/item/item_event.dart';
import '../bloc/result/fetch_results_state.dart';
import '../bloc/result/fetch_results_event.dart';
import 'loading_widget.dart';


class SearchWidget extends SearchDelegate{
  final Bloc<FetchEvent, FetchState> bloc;

  SearchWidget(this.bloc);
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    return _buildItem(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildItem(context);
  }


  Widget _buildItem(BuildContext context){
    bloc.add(FetchSearching(query: query));
    return BlocBuilder(
      bloc: bloc,
      builder: ((context, state) {
        if (state is Loading) {
          return const LoadingWidget();
        } else if (state is Success) {
          return ListView.builder(
              itemCount: state.result.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    if(state.result[index].mediaType != 'person'){
                      context.read<ItemBloc>().add(OnSelectItem(item: state.result[index]));
                      AppNavigator.push(Routes.itemInfo, state.result[index]);
                    }else{
                      AppNavigator.push(Routes.personInfo, state.result[index].id);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      child: Row(
                        children: [
                          (state.result[index].posterPath != null || state.result[index].profilePath != null
                              ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Hero(
                              tag: 'horizontal-hero-${state.result[index].id}',
                              child: Image.network(
                                "https://image.tmdb.org/t/p/w500/${state.result[index].posterPath ?? state.result[index].profilePath}",),
                            ),
                          )
                              : Container(
                            width: 133,
                            height: 282,
                            color: Colors.grey[400],
                          )),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${state.result[index].title ?? state.result[index].name}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                  Text(
                                      "${state.result[index].mediaType?.toUpperCase()}",
                                      style:
                                      Theme.of(context).textTheme.subtitle1),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
          // }else if(state is SearchErrorState) {
          //   return Center(child: Text("${state.message}"));
        }else{
          return Container();
        }
      }),
    );
  }
}
