import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:observer_pattern/weather_observer/weather_observer.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  WeatherObserver? instance1;
  WeatherObserver? instance2;
  bool? resultOfComparison;

  @override
  void initState() {
    super.initState();
    if (WeatherObserver().isTimerRunning == false ) {
      WeatherObserver().createTimerAndNotify();
    }
    WeatherObserver().addListener(doSomethingWhenNotified);
  }

  @override
  void dispose() {
    WeatherObserver().removeListener(doSomethingWhenNotified);
    super.dispose();
  }

  void doSomethingWhenNotified() {
    if (kDebugMode) {
      print('first screen get notified');
    }
    setState(() {});
  }

  void goToSecondScreen() {
    Navigator.of(context).pushReplacementNamed('/second_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('first screen'),
            ElevatedButton(
                onPressed: goToSecondScreen,
                child: const Text('push this button to go to the second screen')
            ),
            Text('weather count ${WeatherObserver().timeSinceEpoch}'),
            const SizedBox(height: 100,),
            const Text('Check if Weather observer is singleton'),
            ElevatedButton(
              onPressed: () {
                instance1 = WeatherObserver();
                setState(() { });
              },
              child: Text('tap on this button to create instance1. \nRight now instance1 = $instance1'),
            ),
            ElevatedButton(
              onPressed: () {
                instance2 = WeatherObserver();
                setState(() { });
              },
              child: Text('tap on this button to create instance2. \nRight now instance2 = $instance2'),
            ),
            ElevatedButton(
              onPressed: () {
                resultOfComparison = (instance1 == instance2);
                setState(() { });
              },
              child: Text('is instance1 == instance2. \n $resultOfComparison'),
            ),
          ],
        ),
      ),
    );
  }
}
