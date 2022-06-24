import 'package:flutter/material.dart';
import 'package:rest_api/routes.dart';

import '../../domain/entities/result.dart';
import '../widgets/item_info/about_widget.dart';
import '../widgets/item_info/item_similar.dart';
import '../widgets/item_info/list_casts.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({Key? key, required this.result}) : super(key: key);
  final Result result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('${result.title ?? result.name}', style: const TextStyle(color: Colors.white),),
        leading: IconButton(
          color: Colors.white,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              AppNavigator.pop();
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AboutWidget(),
            ListCasts(result: result),
            ItemSimilar(result: result),
          ],
        ),
      ),
    );
  }
}
