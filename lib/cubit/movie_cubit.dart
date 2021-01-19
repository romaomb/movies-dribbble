import 'package:bloc/bloc.dart';

import '../model/movie.dart';
import '../model/movie_position.dart';
import '../resources/colors.dart';
import '../resources/images.dart';

class MovieCubit extends Cubit<List<Movie>> {
  MovieCubit() : super([]);

  void fetchMovies() async {
    // To simulate loading option
    // await Future.delayed(Duration(seconds: 2));
    final movies = [
      for (var i = 0; i < 2; i++) ..._generateMovies(),
    ];
    emit(movies);
  }

  List<Movie> _generateMovies() {
    return [
      Movie(
        id: 'sonic2020',
        title: 'Sonic',
        year: '2020',
        genre: 'Fantasy',
        color: MoviesColor.pictonBlue,
        imagePath: Images.sonic,
        imagePosition: ImagePosition.bottomRight,
        imageHeight: 170,
        cardHeight: 238,
      ),
      Movie(
        id: 'scoob2020',
        title: 'Scoob!',
        year: '2020',
        genre: 'Animation/Family',
        color: MoviesColor.scooter,
        imagePath: Images.scooby,
        imagePosition: ImagePosition.bottomRight,
        imageHeight: 208,
        cardHeight: 281,
      ),
      Movie(
        id: 'boss2021',
        title: 'Boss Baby',
        year: '2021',
        genre: 'Fantasy/Adventure',
        color: MoviesColor.doveGray,
        imagePath: Images.bossBaby,
        imagePosition: ImagePosition.topLeft,
        imageHeight: 230,
        cardHeight: 264,
      ),
      Movie(
        id: 'croods2020',
        title: 'Croods',
        year: '2020',
        genre: 'Fantasy/Adventure',
        color: MoviesColor.apricot,
        imagePath: Images.croods,
        imagePosition: ImagePosition.topRight,
        imageHeight: 245,
        cardHeight: 266,
      ),
      Movie(
        id: 'frozen2019',
        title: 'Frozen',
        year: '2019',
        genre: 'Drama/Fantasy',
        color: MoviesColor.java,
        imagePath: Images.forzon,
        imagePosition: ImagePosition.bottomLeft,
        imageHeight: 220,
        cardHeight: 268,
      ),
      Movie(
        id: 'minions202',
        title: 'Minions',
        year: '2020',
        genre: 'Comedy/Animation',
        color: MoviesColor.goldenrod,
        imagePath: Images.minion,
        imagePosition: ImagePosition.bottomLeft,
        imageHeight: 180,
        cardHeight: 223,
      ),
    ];
  }
}
