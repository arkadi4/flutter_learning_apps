import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(

          children: <Widget>[
            Positioned(
              right:  MediaQuery.of(context).size.width * 0.5,
              top: (MediaQuery.of(context).size.height * 0.5) / 2,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.5,
                color: Colors.yellow,
              ),
            ),
            Positioned(
              right:  0,
              top: (MediaQuery.of(context).size.height - MediaQuery.of(context).size.height * 0.8) / 2,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.8,
                color: Colors.blue,
              ),
            ),
            Positioned(
              right:  MediaQuery.of(context).size.width * 0.25,
              top: (MediaQuery.of(context).size.height - MediaQuery.of(context).size.height * 0.85) / 2,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.85,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
