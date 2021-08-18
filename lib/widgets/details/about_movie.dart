import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_movies/blocs/trailer_bloc.dart';
import 'package:rest_api_movies/events/trailer_event.dart';
import 'package:rest_api_movies/models/movie.dart';

class AboutMovie extends StatelessWidget {
  final Movie movie;
  final String mediaType;
  const AboutMovie({Key? key, required this.movie, required this.mediaType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [
          SizedBox(height: 16),
          ClipRRect(
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<TrailerBloc>(context).add(OpenTrailerEvent(id: movie.id, mediaType: mediaType));
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow),
                    Text(
                      "TRAILER",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                color: Colors.grey[200],
                height: 64,
                width: 128,
              ),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          Container(
            child: Text("${movie.title == null ? movie.tvName : movie.title}",
                style: Theme.of(context).textTheme.headline5),
            padding: EdgeInsets.all(10),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "${movie.overview}",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Text("${movie.releaseDay == null ? movie.firstAirDate : movie.releaseDay}",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text("${movie.voteAverage}",
              style: Theme.of(context).textTheme.bodyText1
          ),
          Text("Available streaming in",
              style: Theme.of(context).textTheme.bodyText1
          ),
        ],
      ),
    );
  }
}
