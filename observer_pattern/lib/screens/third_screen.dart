import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:observer_pattern/weather_observer/weather_observer.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {

  void thirdScreenListener() {
    if (kDebugMode) {
      print('third screen got notified');
    }
    setState(() {});
  }

  void goBackToSecondScreen() {
    Navigator.pushReplacementNamed(context, '/second_screen');
  }

  @override
  void initState() {
    super.initState();
    WeatherObserver().addListener(thirdScreenListener);
  }

  @override
  void dispose() {
    WeatherObserver().removeListener(thirdScreenListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Third screen'),
            Text('Weather count ${WeatherObserver().timeSinceEpoch}'),
            ElevatedButton(onPressed: goBackToSecondScreen, child: const Text('Go back to second screen')),
          ],
        ),
      ),
    );
  }
}
