import 'package:flutter/material.dart';
import 'package:rest_api_movies/models/provider.dart';

class StreamingOn extends StatelessWidget {
  final List<Provider>? listStreaming;
  const StreamingOn({Key? key, this.listStreaming}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            height: (listStreaming!.length/1 * 100),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: listStreaming!.length,
              itemBuilder: (context, index) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Container(
                          child: ClipRRect(
                            child: Image.network(
                              "https://www.themoviedb.org/t/p/original/${listStreaming![index].logoPath}",
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                            BorderRadius.circular(4.0),
                          ),
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Text(
                          "${listStreaming![index].nameProvider}",
                          style: Theme.of(context).textTheme.bodyText1
                      )
                    ],
                  );
              },
            ),
          );

  }
}
