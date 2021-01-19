import 'movie_position.dart';

class Movie {
  final String id;
  final String title;
  final String year;
  final String genre;
  final int color;
  final String imagePath;
  final ImagePosition imagePosition;
  final double imageHeight;
  final double cardHeight;

  const Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.genre,
    required this.color,
    required this.imagePath,
    required this.imagePosition,
    required this.imageHeight,
    required this.cardHeight,
  });
}
