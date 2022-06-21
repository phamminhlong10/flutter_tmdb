import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/platform/url_launch.dart';
import '../../../../injection_container.dart';
import '../bloc/result/fetch_results_bloc.dart';
import '../bloc/result/fetch_results_event.dart';
import '../bloc/result/fetch_results_state.dart';
import '../widgets/list_item_horizontal.dart';
import '../widgets/list_person_horizontal.dart';
import '../widgets/loading_widget.dart';
import '../widgets/search_widget.dart';

class CAHome extends StatelessWidget {
  const CAHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: const FlutterLogo(
            size: 32,
          ),
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: () {
                showSearch(context: context, delegate: SearchWidget(sl<FetchBloc>()));
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    child: Image.network(
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.6,
                        'https://image.tmdb.org/t/p/w1280/yxIdKGEjagaLs5kMjw92kAHmopH.jpg'),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            UrlLaunch().openURL(
                                'https://www.youtube.com/watch?v=xXBTImqyeU0');
                          },
                          child: const Text('Trailer', style: TextStyle(color: Colors.black),)),
                      IconButton(
                        color: Colors.white60,
                        onPressed: () {
                        },
                        icon: const Icon(Icons.info_outline),
                      )
                    ],
                  )
                ],
              ),
              BlocProvider(
                create: (context) => sl<FetchBloc>()..add(FetchResults(type: 'movie')),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("POPULAR MOVIES",
                            style: Theme.of(context).textTheme.subtitle1),
                        const SizedBox(height: 8),
                        BlocBuilder<FetchBloc, FetchState>(
                            builder: (context, state) {
                          if (state is Loading) {
                            return const LoadingWidget();
                          } else if (state is Success) {
                            return ListItemHorizontal(list: state.result);
                          } else if (state is Error) {
                            return Center(child: Text("${state.message}"));
                          } else {
                            return Container();
                          }
                        }),
                      ],
                    ),
                  ),
              ),
              BlocProvider(
                create: (context) => sl<FetchBloc>()..add(FetchResults(type: 'tv')),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("POPULAR TVS",
                          style: Theme.of(context).textTheme.subtitle1),
                      const SizedBox(height: 8),
                      BlocBuilder<FetchBloc, FetchState>(
                          builder: (context, state) {
                            if (state is Loading) {
                              return const LoadingWidget();
                            } else if (state is Success) {
                              return ListItemHorizontal(list: state.result);
                            } else if (state is Error) {
                              return Center(child: Text("${state.message}"));
                            } else {
                              return Container();
                            }
                          }),
                    ],
                  ),
                ),
              ),
              BlocProvider(
                create: (context) => sl<FetchBloc>()..add(FetchResults(type: 'person')),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("POPULAR PERSONS",
                          style: Theme.of(context).textTheme.subtitle1),
                      const SizedBox(height: 8),
                      BlocBuilder<FetchBloc, FetchState>(
                          builder: (context, state) {
                            if (state is Loading) {
                              return const LoadingWidget();
                            } else if (state is Success) {
                              return ListPersonHorizontal(list: state.result);
                            } else if (state is Error) {
                              return Center(child: Text("${state.message}"));
                            } else {
                              return Container();
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
