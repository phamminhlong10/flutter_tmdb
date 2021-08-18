import 'package:flutter/material.dart';
import 'package:rest_api_movies/models/movie.dart';
import 'package:rest_api_movies/pages/movie_details.dart';

class ListParticipate extends StatelessWidget {
  final List<Movie>? movies;
  const ListParticipate({Key? key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (movies!.length) % 2 != 0 ? (movies!.length * 340) / 2 + 170 : (movies!.length * 340) / 2,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              mainAxisExtent: 320),
          physics: NeverScrollableScrollPhysics(),
          itemCount: movies!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MovieDetails(
                      id: movies![index].id,
                      mediaType: movies![index].mediaType);
                }));
              },
              child: Container(
                child: Column(
                  children: [
                    movies![index].poster != null
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              "https://image.tmdb.org/t/p/w220_and_h330_face/${movies![index].poster}",
                          ),
                        )
                        : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                          child: Container(
                              height: 300,
                              width: 220,
                              color: Colors.grey[50],
                            ),
                        ),
                    Text("${movies![index].title}")
                  ],
                ),
              ),
            );
          }),
    );
  }
}
