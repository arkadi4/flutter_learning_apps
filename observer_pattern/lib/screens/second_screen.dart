import 'package:dart_date/dart_date.dart';

import 'package:flutter/material.dart';
import 'package:observer_pattern/weather_observer/weather_observer.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  WeatherObserver instance1 = WeatherObserver();
  WeatherObserver instance2 = WeatherObserver();

  @override
  void initState() {
    super.initState();
    instance1.display();
  }


  void goToThirdScreen() {
    Navigator.of(context).pushNamed('/third_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second screen'),

      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text('second screen'),
            ),
            ElevatedButton(
                onPressed: goToThirdScreen,
                child: Text('push this button to go to the third screen'),
            ),
            Text('data'),









            SizedBox(height: 100,),
            ElevatedButton(
              onPressed: () {
                instance1 = WeatherObserver();
                setState(() {

                });
              },
              child: Text('instance1 $instance1'),
            ),
            ElevatedButton(
              onPressed: () {
                instance2 = WeatherObserver();
                setState(() {

                });
              },
              child: Text('instance1 $instance2'),
            ),
            Text('comparison ${instance1 == instance2}'),
          ],
        ),
      ),
    );
  }
}