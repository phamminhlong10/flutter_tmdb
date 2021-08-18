import 'package:flutter/material.dart';
import 'package:rest_api_movies/models/image.dart';
import 'package:rest_api_movies/pages/original_image.dart';

class ListBackDrops extends StatelessWidget {
  final List<MediaImage>? originalImage;
  const ListBackDrops({Key? key, this.originalImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 150,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return OriginalImage(
                          path: originalImage![index].path);
                    })),
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: ClipRRect(
                    child: Image.network(
                      "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/${originalImage![index].path}",
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
            itemCount: originalImage!.length,
            scrollDirection: Axis.horizontal,
          ),
        );
  }
}
