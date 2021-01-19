import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../cubit/movie_cubit.dart';
import '../model/movie.dart';
import '../resources/colors.dart';
import '../util/circle_tab_indicator.dart';
import '../util/tabs.dart';
import '../widget/movie_app_bar.dart';
import 'upcoming_movies_page.dart';

const _tabCount = 5; // Workaround to have 2 spaces between 3 tabs
const _scrollDuration = Duration(milliseconds: 600);

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final _upcomingMoviesScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<MovieCubit>().fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabCount,
      child: Scaffold(
        appBar: MovieAppBar(
          tabBar: _buildTabBar(),
          onShareClick: () => _scrollTo(280.0),
          onSearchClick: () => _scrollTo(0.0),
        ),
        backgroundColor: Colors.white,
        body: CustomTabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildFirstTab(),
            Container(), // Placeholder
            Container(), // Placeholder
          ],
        ),
      ),
    );
  }

  PreferredSize _buildTabBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kTextTabBarHeight),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
        child: CustomTabBar(
          customSpacing: SizedBox(width: 92.0),
          isScrollable: true,
          labelColor: Colors.black,
          labelStyle: GoogleFonts.ibmPlexSans(fontSize: 20.0),
          unselectedLabelColor: Colors.black.withOpacity(0.3),
          indicator: CircleTabIndicator(
            color: Color(MoviesColor.scooter),
            radius: 3.0,
          ),
          tabs: [
            CustomTab(text: 'Upcoming'),
            CustomTab(text: 'Now Playing'),
            CustomTab(text: 'Adventure'),
          ],
        ),
      ),
    );
  }

  void _scrollTo(double offset) => _upcomingMoviesScrollController.animateTo(
        offset,
        duration: _scrollDuration,
        curve: Curves.easeInOut,
      );

  Widget _buildFirstTab() {
    return BlocBuilder<MovieCubit, List<Movie>>(
      builder: (_, movies) {
        return movies.isEmpty
            ? Center(child: CircularProgressIndicator())
            : UpcomingMoviesPage(movies, _upcomingMoviesScrollController);
      },
    );
  }
}
