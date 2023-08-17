

import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  void goToSecondScreen() {
    Navigator.of(context).pushNamed('/second_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First screen'),
      ),
      body: Center(
        child: Container(

          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text('first screen'),
              ElevatedButton(
                onPressed: goToSecondScreen,
                child: Text('push this button to go to the second screen')
              ),
            ],
          ),
        ),
      ),
    );
  }
}