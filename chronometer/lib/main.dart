import 'dart:async';
import 'package:flutter/material.dart';

class CountAndLabel {
  int count = 0;
  dynamic label = const Duration(seconds: 0);
}

void main() {
  runApp(
 const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chronometer app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late DateTime timeStart;
  late dynamic label;
  late Stream<Duration> stream1;
  late Stream<dynamic> stream2;
  late Stream<dynamic> stream3;
  CountAndLabel tempValue = CountAndLabel();


  @override
  void initState() {
    super.initState();
    timeStart = DateTime.now();

    stream1 = Stream.periodic(const Duration(seconds: 1), (int count) {
      label = DateTime.now().difference(timeStart);
      return label;
    });

    stream2 = Stream.periodic(const Duration(seconds: 10), (int count) {
      tempValue.count = count;
      tempValue.label = label;
      return tempValue;
    });

    stream2.listen((event) {
      if ( (event.count+1) % 4 != 0 || event.count == 0) {
        _showToast(context, event.label);
      }
    });

    stream3 = Stream.periodic(const Duration(seconds: 40), (int count) {
      tempValue.label = 'Surprise';
      return tempValue;
    });

    stream3.listen((event) {
      _showToast(context, event.label);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showToast(BuildContext context, dynamic label) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text('$label'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
                // initialData: ,
                stream: stream1,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text('Time since app start ${snapshot.data}');
                }
            ),
          ],
        ),
      ),
    );
  }
}
