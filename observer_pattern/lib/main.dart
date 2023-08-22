import 'package:flutter/material.dart';
import 'package:observer_pattern/screens/first_screen.dart';
import 'package:observer_pattern/screens/second_screen.dart';
import 'package:observer_pattern/screens/third_screen.dart';
import 'package:observer_pattern/weather_observer/weather_observer.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // var instance = WeatherObserver();
    // instance.createTimerAndNotify();
    // WeatherObserver().createTimerAndNotify();

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
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

// class FirstChildInTree extends StatefulWidget {
//   const FirstChildInTree({super.key});
//
//   @override
//   State<FirstChildInTree> createState() => _FirstChildInTreeState();
// }
//
// class _FirstChildInTreeState extends State<FirstChildInTree> {
//
//   var model = Model();
//
//   @override
//   Widget build(BuildContext context) {
//     var modelWatch = context.watch<WeatherObserver>();
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('first child'),
//             Text('model ${model.a}'),
//             Text('model ${modelWatch}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Model with ChangeNotifier{
//   var a = 1;
// }



