import 'package:flutter/material.dart';

import '../movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 1;
  static List<Widget> _widgetOptions = <Widget> [
    Text(
      'Index 0: news'
    ),
    MovieListWidget(),
    Text(
        'Index 2: tv shows'
    ),
  ];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
    print('stop spot');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TMDB'),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          Text(
              'Index 0: news'
          ),
          MovieListWidget(),
          Text(
              'Index 2: tv shows'
          ),
        ],
      ),
      // Center(
      //   child: _widgetOptions[_selectedTab],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'news',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_edit),
            label: 'movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'tv shows',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}
