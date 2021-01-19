import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/offset_position_cubit.dart';
import '../model/movie.dart';
import '../model/movie_position.dart';
import '../model/offset_position.dart';
import 'movie_info.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final bool isLeftCard;

  const MovieCard({
    required this.movie,
    required this.isLeftCard,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildContainerForCard(),
        BlocBuilder<OffsetPositionCubit, OffsetPosition>(
          builder: (_, position) => AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            left: position.left,
            top: position.top,
            right: position.right,
            bottom: position.bottom,
            child: Image.asset(
              movie.imagePath,
              height: movie.imageHeight,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContainerForCard() {
    return Padding(
      padding: EdgeInsets.only(
        top: 20.0,
        left: isLeftCard ? 20.0 : 0.0,
        right: isLeftCard ? 0.0 : 20.0,
      ),
      child: Card(
        color: Color(movie.color),
        elevation: 0.0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: _buildMovieInfo(movie),
      ),
    );
  }

  Widget _buildMovieInfo(Movie movie) {
    return Container(
      height: movie.cardHeight,
      padding: EdgeInsets.only(
        left: 15.0,
        top: movie.imagePosition.isTop ? 0.0 : 15.0,
        bottom: movie.imagePosition.isBottom ? 0.0 : 15.0,
      ),
      alignment:
          movie.imagePosition.isTop ? Alignment.bottomLeft : Alignment.topLeft,
      child: MovieInfo(movie: movie),
    );
  }
}
