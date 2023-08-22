import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:observer_pattern/weather_observer/weather_observer.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  @override
  void initState() {
    super.initState();
    WeatherObserver().addListener(doSomethingWhenNotifiedOnSecondScreen);
  }

  void doSomethingWhenNotifiedOnSecondScreen() {
    if (kDebugMode) {
      print('second screen get notified');
    }
    setState(() {});
  }

  void goBackToFirstScreen() {
    Navigator.pushReplacementNamed(context, '/first_screen');
  }

  void goToThirdScreen() {
    WeatherObserver().removeListener(doSomethingWhenNotifiedOnSecondScreen);
    Navigator.of(context).pushReplacementNamed('/third_screen');
  }

  @override
  void dispose() {
    WeatherObserver().removeListener(doSomethingWhenNotifiedOnSecondScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: Text('second screen'),
            ),
            ElevatedButton(
                onPressed: goBackToFirstScreen,
                child: const Text('push this button to go back to first screen'),
            ),
            ElevatedButton(
              onPressed: goToThirdScreen,
              child: const Text('push this button to go to the third screen'),
            ),
            Text('weather count ${WeatherObserver().timeSinceEpoch}'),
          ],
        ),
      ),
    );
  }
}