import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_with_design_8_custom_progress_bar/custom_progress_bar.dart';
import 'package:work_with_design_8_custom_progress_bar/view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ViewModel(progress: 0), // Random().nextInt(100)/100
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Custom progress bar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Custom progress bar Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget  {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    ViewModel viewModel = context.watch<ViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: CustomPaint(
                    painter: CustomProgressBar(
                      progress: _animationController.value,
                    ),
                  ),
                ),
                Positioned(
                  top: 85,
                  left: 85,
                  child: Text(
                    '${(viewModel.progress * 100).toInt()}',
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  )
                ),
              ],
            ),
            const SizedBox(height: 40,),
            TextButton(
              onPressed: ()  {
                viewModel.progress = Random().nextInt(100)/100;
                _animationController.reset();
                _animationController.forward();
                _animationController.animateTo(viewModel.progress);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(49, 137, 144, 1)),
                foregroundColor: MaterialStatePropertyAll(Color.fromRGBO(255, 255, 255, 1)),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                ),
                minimumSize: MaterialStatePropertyAll(Size(200, 40)),
              ),
              child: const Text('Animate with random value')
            ),
          ],
        ),
      ),
    );
  }
}
