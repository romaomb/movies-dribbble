import 'package:flutter/material.dart';

const double toolbarHeight = 120.0;

class MovieAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSize? tabBar;
  final bool showTitle;
  final VoidCallback? onShareClick;
  final VoidCallback? onSearchClick;

  @override
  final Size preferredSize;

  MovieAppBar({
    this.tabBar,
    this.showTitle = true,
    this.onShareClick,
    this.onSearchClick,
  }) : preferredSize =
            Size.fromHeight(tabBar == null ? kToolbarHeight : toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: showTitle ? _buildAppBarTitle() : null,
      titleSpacing: showTitle ? 20.0 : null,
      actions: _buildActionIcons(),
      bottom: tabBar,
      toolbarHeight: toolbarHeight,
      backgroundColor: Colors.transparent,
    );
  }

  List<Widget> _buildActionIcons() {
    return [
      IconButton(
        icon: Icon(Icons.cast, color: Colors.black),
        onPressed: onShareClick,
      ),
      IconButton(
        icon: Icon(Icons.search_rounded, color: Colors.black),
        onPressed: onSearchClick,
      ),
      SizedBox(width: 10.0),
    ];
  }

  Widget _buildAppBarTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            'Movies Now',
            style: TextStyle(height: 1.0),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Bangalore', style: TextStyle(fontSize: 12.0)),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
              size: 14.0,
            ),
          ],
        )
      ],
    );
  }
}
