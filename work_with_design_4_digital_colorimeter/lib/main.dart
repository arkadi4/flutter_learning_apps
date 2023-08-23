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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
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

  late double sideLengthOfBigSquare = MediaQuery.of(context).size.width * 0.75;
  late double sideLengthOfSmallSquare = sideLengthOfBigSquare / 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: sideLengthOfBigSquare,
              height: sideLengthOfBigSquare,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(239, 49, 36, 1.0),
                border: BorderDirectional(
                  start: BorderSide(color: Color.fromRGBO(219, 49, 42, 1.0),),
                  top: BorderSide(color: Color.fromRGBO(150, 30, 120, 1.0),),
                  end: BorderSide(color: Color.fromRGBO(62, 12, 202, 1.0),),
                  bottom: BorderSide(color: Color.fromRGBO(190, 189, 201, 1.0),),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: sideLengthOfSmallSquare,
                height: sideLengthOfSmallSquare,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(153, 204, 0, 1.0),
                  border: Border.all(
                    color: const Color.fromRGBO(166, 200, 65, 1.0),
                  )
                ),
              ),
            ),
            Positioned(
              left: sideLengthOfBigSquare - sideLengthOfSmallSquare,
              top: 0,
              child: Container(
                width: sideLengthOfSmallSquare,
                height: sideLengthOfSmallSquare,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 1.0),
                  border: BorderDirectional(
                    start: BorderSide(color: Color.fromRGBO(177, 177, 177, 1.0),),
                    bottom: BorderSide(color: Color.fromRGBO(49, 49, 49, 1.0),),
                  ),
                ),
              ),
            ),
            Positioned(
              left: sideLengthOfBigSquare /2 - sideLengthOfSmallSquare/2,
              top: sideLengthOfBigSquare /2 - sideLengthOfSmallSquare/2,
              child: Container(
                width: sideLengthOfSmallSquare,
                height: sideLengthOfSmallSquare,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(170, 102, 204, 1.0),
                  border: BorderDirectional(
                    start: BorderSide(color: Color.fromRGBO(222, 101, 93, 1.0),),
                    top: BorderSide(color: Color.fromRGBO(171, 109, 203, 1.0),),
                    end: BorderSide(color: Color.fromRGBO(194, 185, 185, 1.0),),
                    bottom: BorderSide(color: Color.fromRGBO(194, 127, 162, 1.0),),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: sideLengthOfBigSquare  - sideLengthOfSmallSquare,
              child: Container(
                width: sideLengthOfSmallSquare,
                height: sideLengthOfSmallSquare,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(51, 181, 229, 1.0),
                  border: BorderDirectional(
                    start: BorderSide(color: Color.fromRGBO(122, 117, 143, 1.0),),
                    top: BorderSide(color: Color.fromRGBO(225, 92, 83, 1.0),),
                    end: BorderSide(color: Color.fromRGBO(99, 185, 216, 1.0),),
                    bottom: BorderSide(color: Color.fromRGBO(167, 186, 210, 1.0),),
                  ),
                ),
              ),
            ),
            Positioned(
              left: sideLengthOfBigSquare  - sideLengthOfSmallSquare / 2,
              top: 0,
              child: Container(
                width: sideLengthOfSmallSquare / 2,
                height: sideLengthOfSmallSquare / 2,
                // color: Colors.red,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 136, 0, 1.0),
                  border: BorderDirectional(
                    start: BorderSide(color: Color.fromRGBO(136, 109, 79, 1.0),),
                    top: BorderSide(color: Color.fromRGBO(160, 84, 98, 1.0),),
                    end: BorderSide(color: Color.fromRGBO(51, 46, 240, 1.0),),
                    bottom: BorderSide(color: Color.fromRGBO(18, 18, 18, 1.0),),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
