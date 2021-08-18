import 'package:flutter/material.dart';


class AppBarDetails extends StatelessWidget {
  final String? poster;
  const AppBarDetails({Key? key, this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Container(),
      floating: false,
      pinned: false,
      snap: false,
      expandedHeight: 400,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100)),
            child: Image.network(
              "https://www.themoviedb.org/t/p/original/$poster",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
