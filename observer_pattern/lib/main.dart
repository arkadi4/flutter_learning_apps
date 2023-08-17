import 'package:flutter/material.dart';
import 'package:observer_pattern/screens/first_screen.dart';
import 'package:observer_pattern/screens/second_screen.dart';
import 'package:observer_pattern/screens/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // home: const FirstScreen(),
      routes: {
        '/first_screen' : (context) => FirstScreen(),
        '/second_screen' : (context) => SecondScreen(),
        '/third_screen' : (context) => ThirdScreen(),
      //   '/main_screen' : (context) => MainScreenWidget(),
      //   '/main_screen/movie_details' : (context) {
      //     final arguments = ModalRoute.of(context)?.settings.arguments;
      //     if (arguments is int) {
      //       return MovieDetailsWidget(movieId: arguments,);
      //     }
      //     return MovieDetailsWidget(movieId: 0,);
      //   },
      },
      initialRoute: '/first_screen',
    );
  }
}


