import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'design_1',
      home: MyHomePage(title: 'design_1'),
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
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            padding: const EdgeInsets.all(10.0),
            child: FittedBox(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.purple,
                  ),
                  const SizedBox(height: 25,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 25,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.yellow,
                  ),
                  const SizedBox(height: 25,),
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width, 50.0)),
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                    ),
                    child: const Text('Button'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
