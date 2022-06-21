import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api/routes.dart';
import 'features/presentation/bloc/cast/cast_bloc.dart';
import 'features/presentation/bloc/item/item_bloc.dart';
import 'features/presentation/bloc/person/person_bloc.dart';
import 'features/presentation/bloc/result/fetch_results_bloc.dart';
import 'features/presentation/bloc/trailer/trailer_bloc.dart';
import 'features/presentation/widgets/theme.dart';
import 'injection_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ItemBloc>(
            create: (context) => sl<ItemBloc>(),
          ),
          BlocProvider<FetchBloc>(create: (context) => sl<FetchBloc>()),
          BlocProvider<CastBloc>(create: (context) => sl<CastBloc>()),
          BlocProvider<PersonBloc>(create: (context) => sl<PersonBloc>()),
          BlocProvider<TrailerBloc>(create: (context) => sl<TrailerBloc>())
        ],
        child: MaterialApp(
          theme: buildTheme(),
          navigatorKey: AppNavigator.navigatorKey,
          onGenerateRoute: AppNavigator.onGenerateRoute,
        ));
  }
}
