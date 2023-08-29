import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_with_design_7_compound_view/custom_view.dart';
import 'package:work_with_design_7_compound_view/view_model_custom_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compound view',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Compound view Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ChangeNotifierProvider(
        create: (context) => ViewModelCustomView(),
        child: const CustomView()
      ),
    );
  }
}
