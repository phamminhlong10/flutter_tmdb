import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:photo_view/photo_view.dart';
import 'package:rest_api_movies/blocs/original_image_bloc.dart';
import 'package:rest_api_movies/events/original_image_event.dart';
import 'package:rest_api_movies/state/original_image_state.dart';

class OriginalImage extends StatelessWidget {
  final String? path;

  const OriginalImage({Key? key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      OriginalImageBloc()
        ..add(ClickToShowOriginalImageEvent(path: path)),
      child: BlocBuilder<OriginalImageBloc, OriginalImageState>(
        builder: (context, state) {
          if(state is OriginalImageLoadedState){
            return GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Scaffold(
                backgroundColor: Colors.black,
                body: Container(
                  child: Center(
                    child: PhotoView(
                        imageProvider: NetworkImage("https://www.themoviedb.org/t/p/original/${state.path}")),
                  ),
                ),
              ),
            );
          }else if (state is OriginalImageFailureState){
            return Scaffold(
              body: Center(
                child: Text("Failed to load image from server"),
              ),
            );
          }else{
            return Scaffold(
              body: Center(
                child: SpinKitFadingCircle(
                  size: 64.0,
                  color: Colors.blueAccent,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
