import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  double secondContainerHeight = 50;

  void changeHeightOfSecondContainer() {
    secondContainerHeight = MediaQuery.of(context).size.height - 50;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 100,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 50,),
                  Container(
                    // width: MediaQuery.of(context).size.width - 50,
                    // height: MediaQuery.of(context).size.height - 50,
                    height: secondContainerHeight,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: changeHeightOfSecondContainer,
              child: const Text('Push the button to see if screen becomes scrollable,\n'
                  'when content doesn\'t fit screen height ')
            ),
          ],
        ),
      ),
    );
  }
}
