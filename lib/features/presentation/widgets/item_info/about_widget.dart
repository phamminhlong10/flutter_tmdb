import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/platform/url_launch.dart';
import '../../bloc/item/item_bloc.dart';
import '../../bloc/item/item_state.dart';
import '../../bloc/trailer/trailer_bloc.dart';
import '../../bloc/trailer/trailer_event.dart';
import '../../bloc/trailer/trailer_state.dart';
import '../loading_widget.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(
      bloc: context.read<ItemBloc>(),
      builder: (context, state) {
        if (state is ItemLoadingState) {
          return const LoadingWidget();
        } else if (state is ItemLoadedState) {
          return Column(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(80),
                      bottomLeft: Radius.circular(80)),
                  child: Hero(
                    tag: 'horizontal-hero-${state.item.id}',
                    child: Image.network(
                        "https://image.tmdb.org/t/p/w500/${state.item.posterPath}"),
                  )),
              Column(
                children: [
                  const SizedBox(height: 16),
                  BlocListener<TrailerBloc, TrailerState>(
                    listener: (context, state) {
                      if (state is TrailerLoaded) {
                        UrlLaunch().openURL(
                            'https://www.youtube.com/watch?v=${state.trailer.key}');
                      }
                    },
                    child: ElevatedButton.icon(
                        onPressed: () {
                          context.read<TrailerBloc>().add(OnPressTrailer(
                              type: state.item.releaseDate != null ? 'movie' : 'tv',
                              id: state.item.id));
                        },
                        icon: Icon(Icons.play_arrow,
                            color: Theme.of(context).primaryColor),
                        label: const Text(
                          "TRAILER",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text("${state.item.title ?? state.item.name}",
                        style: Theme.of(context).textTheme.headline5),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "${state.item.overview}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.item.releaseDate != null
                        ? 'Release date'
                        : 'First air date',
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "${state.item.releaseDate ?? state.item.firstAirDate}",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: 8),
                  const Text('Vote average',
                      style: TextStyle(color: Colors.white)),
                  Text("${state.item.voteAverage}",
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(height: 8)
                ],
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
