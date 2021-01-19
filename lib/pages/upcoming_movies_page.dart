import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:widgets_visibility_provider/widgets_visibility_provider.dart';

import '../cubit/offset_position_cubit.dart';
import '../model/movie.dart';
import '../widget/movie_card.dart';

class UpcomingMoviesPage extends StatelessWidget {
  final List<Movie> movies;
  final ScrollController scrollController;

  const UpcomingMoviesPage(this.movies, this.scrollController);

  @override
  Widget build(BuildContext context) {
    return WidgetsVisibilityProvider(
      child: StaggeredGridView.countBuilder(
        primary: false,
        crossAxisCount: 4,
        mainAxisSpacing: 10.0, // vertical
        crossAxisSpacing: 30.0, // horizontal
        itemCount: movies.length,
        controller: scrollController,
        staggeredTileBuilder: (_) => StaggeredTile.fit(2),
        itemBuilder: (_, index) => _buildMovieCard(index),
      ),
    );
  }

  Widget _buildMovieCard(int index) {
    final movie = movies[index];
    return Provider(
      create: (_) => OffsetPositionCubit(),
      builder: (context, __) => VisibleNotifierWidget(
        data: index,
        listener: (_, __, position) =>
            context.read<OffsetPositionCubit>().onScroll(
                  position,
                  movie.imagePosition,
                  movie.imageHeight,
                ),
        child: MovieCard(
          movie: movie,
          isLeftCard: index.isEven,
        ),
      ),
    );
  }
}
