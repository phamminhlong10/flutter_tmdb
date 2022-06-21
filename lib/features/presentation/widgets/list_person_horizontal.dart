import 'package:flutter/material.dart';
import 'package:rest_api/routes.dart';

import '../../domain/entities/cast.dart';
import '../../domain/entities/result.dart';

class ListPersonHorizontal extends StatelessWidget {
  const ListPersonHorizontal({Key? key, this.list, this.casts}) : super(key: key);
  final List<Result>? list;
  final List<Cast>? casts;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (list != null ? list?.length : casts?.length),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      AppNavigator.push(Routes.personInfo, list?[index].id ?? casts?[index].id);
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            foregroundImage: NetworkImage(
                                "https://www.themoviedb.org/t/p/original/${casts == null ? list![index].profilePath : casts![index].profilePath}"),
                            radius: 64,
                            backgroundColor: Colors.grey[100],
                          ),
                          const SizedBox(height: 16.0),
                          Text("${casts == null ? list![index].name : casts![index].name}",
                              style: Theme.of(context).textTheme.subtitle2)
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
