import 'package:flutter/material.dart';
import 'package:rest_api/core/animation/slide_up.dart';
import 'package:rest_api/features/domain/entities/result.dart';
import 'package:rest_api/features/presentation/pages/home.dart';
import 'package:rest_api/features/presentation/pages/item_info.dart';
import 'package:rest_api/features/presentation/pages/person_info.dart';

enum Routes{home, itemInfo, personInfo}

class _Paths{
  static const String home = '/home';
  static const String itemInfo = '/itemInfo';
  static const String personInfo = '/personInfo';

  static const Map<Routes, String> _pathMap = {
    Routes.home: _Paths.home,
    Routes.itemInfo: _Paths.itemInfo,
    Routes.personInfo: _Paths.personInfo,
  };

  static String of(Routes routes) => _pathMap[routes] ?? home;
}

class AppNavigator{
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case _Paths.home:
        return MaterialPageRoute(builder: (context) => const Home());
      case _Paths.itemInfo:
        final args = settings.arguments as Result;
        return MaterialPageRoute(builder: (context) => ItemInfo(result: args));
      case _Paths.personInfo:
        final args = settings.arguments as int;
        return SlideUp(page: PersonInfo(id: args));
      default:
        return MaterialPageRoute(builder: (context) => const Home());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}