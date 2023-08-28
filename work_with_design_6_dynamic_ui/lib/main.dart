import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_with_design_6_dynamic_ui/first_screen.dart';
import 'package:work_with_design_6_dynamic_ui/second_screen.dart';
import 'package:work_with_design_6_dynamic_ui/third_screen.dart';
import 'package:work_with_design_6_dynamic_ui/view_model.dart';

void main() {
  runApp(

    ChangeNotifierProvider.value(
    value: ViewModel(),
    child: const MyApp(),

    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic ui',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/start_screen',
      routes: {
        '/start_screen' : (context) => MyHomePage(title: 'Dynamic ui'),
        '/first_screen' : (context) => FirstScreen(),
        '/second_screen' : (context) => SecondScreen(),
        '/third_screen' : (context) => ThirdScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // ViewModel viewModel = ViewModel();

  @override
  Widget build(BuildContext context) {
    return StartScreen();
    // return ChangeNotifierProvider.value(
    //   value: viewModel,
    //   child: StartScreen(),
    // );
  }
}


class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  void goToFirstScreen() {
    Navigator.of(context).pushNamed('/first_screen');
  }

  void goToSecondScreen() {
    Navigator.of(context).pushNamed('/second_screen');
  }

  void goToThirdScreen() {
    Navigator.of(context).pushNamed('/third_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('start screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: goToFirstScreen,
              child: Text('first screen'),
            ),
            ElevatedButton(
              onPressed: goToSecondScreen,
              child: Text('second screen'),
            ),
            ElevatedButton(
              onPressed: goToThirdScreen,
              child: Text('third screen'),
            ),
          ],
        ),
      ),
    );;
  }
}

