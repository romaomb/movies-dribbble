import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/movie_cubit.dart';
import 'pages/movie_list_page.dart';
import 'resources/routes.dart';
import 'resources/theme.dart';

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieCubit(),
      child: MaterialApp(
        title: 'movies_dribbble',
        theme: appTheme(),
        initialRoute: Routes.movieList,
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (_) => _buildRoute(settings),
            settings: settings,
          );
        },
      ),
    );
  }

  Widget _buildRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.movieList:
        return MovieListPage();
      default:
        return Center(child: Text('Wrong route'));
    }
  }
}
