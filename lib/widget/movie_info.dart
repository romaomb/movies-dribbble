import 'package:flutter/material.dart';

import '../model/movie.dart';

class MovieInfo extends StatelessWidget {
  final Movie movie;
  final double titleSize;
  final double yearSize;

  const MovieInfo({
    required this.movie,
    this.titleSize = 20.0,
    this.yearSize = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Text(
          movie.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: titleSize,
            height: 1.0,
          ),
        ),
        Text(
          '${movie.year} ‧ ${movie.genre}',
          style: TextStyle(
            color: Colors.white,
            fontSize: yearSize,
          ),
        ),
      ],
    );
  }
}
