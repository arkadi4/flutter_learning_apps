import 'package:flutter/material.dart';

class Movie {
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {

  MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      imageName: 'images/image1.png',
      title: 'Afonya',
      time: '01 01 1977',
      description: 'Movie description fffffffffffffffffffffffffffffffffffff'
          'ffffffffffffffffffffffffffffffffffffff'
    ),
    Movie(
        imageName: 'images/image1.png',
        title: 'Mortal combat',
        time: '01 01 1977',
        description: 'Movie description fffffffffffffffffffffffffffffffffffff'
            'ffffffffffffffffffffffffffffffffffffff'
    ),Movie(
        imageName: 'images/image1.png',
        title: 'Dead man',
        time: '01 01 1977',
        description: 'Movie description fffffffffffffffffffffffffffffffffffff'
            'ffffffffffffffffffffffffffffffffffffff'
    ),Movie(
        imageName: 'images/image1.png',
        title: 'Terminator',
        time: '01 01 1977',
        description: 'Movie description fffffffffffffffffffffffffffffffffffff'
            'ffffffffffffffffffffffffffffffffffffff'
    ),Movie(
        imageName: 'images/image1.png',
        title: 'Rambo first blood',
        time: '01 01 1977',
        description: 'Movie description fffffffffffffffffffffffffffffffffffff'
            'ffffffffffffffffffffffffffffffffffffff'
    ),Movie(
        imageName: 'images/image1.png',
        title: 'Gladiator',
        time: '01 01 1977',
        description: 'Movie description fffffffffffffffffffffffffffffffffffff'
            'ffffffffffffffffffffffffffffffffffffff'
    ),Movie(
        imageName: 'images/image1.png',
        title: 'Elisa',
        time: '01 01 1977',
        description: 'Movie description fffffffffffffffffffffffffffffffffffff'
            'ffffffffffffffffffffffffffffffffffffff'
    ),Movie(
        imageName: 'images/image1.png',
        title: 'Law abiding citizen',
        time: '01 01 1977',
        description: 'Movie description fffffffffffffffffffffffffffffffffffff'
            'ffffffffffffffffffffffffffffffffffffff'
    ),Movie(
        imageName: 'images/image1.png',
        title: 'Departed',
        time: '01 01 1977',
        description: 'Movie description fffffffffffffffffffffffffffffffffffff'
            'ffffffffffffffffffffffffffffffffffffff'
    ),Movie(
        imageName: 'images/image1.png',
        title: 'Transformers',
        time: '01 01 1977',
        description: 'Movie description fffffffffffffffffffffffffffffffffffff'
            'ffffffffffffffffffffffffffffffffffffff'
    ),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ]
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(movie.imageName),
                          // width: 100,
                          // fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                movie.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                movie.time,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                movie.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      onTap: () {
                        print('push');
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'search',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
