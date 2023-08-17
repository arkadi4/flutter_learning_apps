

import 'dart:async';

import 'package:dart_date/dart_date.dart';

class WeatherObserver {
  WeatherObserver._privateConstructor();

  static final WeatherObserver instance = WeatherObserver._privateConstructor();

  factory WeatherObserver() {
    return instance;
  }

  String time = (DateTime.now()).toString();
  int timeSinceEpoch = DateTime.now().secondsSinceEpoch;
  String algorithmOfWeatherCount = (DateTime.now()).toString();
  Timer timerWeatherObserver = Timer(Duration(seconds: 5), () {
    print('initial timer');
  });

  String xxx = "xxx";


  void updateTime() {
    time = (DateTime.now()).toString();
    timeSinceEpoch = DateTime.now().secondsSinceEpoch;
    xxx = 'gggggg';
  }

  void createTimerWith5SecondsUpdate() {
    // Timer.periodic(Duration(seconds: 3), (time) => print('YPA $time'));
    var counter = 10;
    timerWeatherObserver = Timer.periodic(Duration(seconds: 3), (timer) {
      time = (DateTime.now()).toString();
      timeSinceEpoch = DateTime.now().secondsSinceEpoch;
      print(timer.tick);
      print('time $time estimate $timeSinceEpoch');
      if (timer.tick == 5) {
        timer.cancel();
      }
      // print(timer.tick);
      // counter--;
      // if (counter == 0) {
      //   print('Cancel timer');
      //   timer.cancel();
      // }
    });
    // Timer(() => print('YPA'), );
  }

  void cancelTimer() {
    timerWeatherObserver.cancel();
  }

  void displayTime() {
    print('time $time');
  }

  void display() {
    print('algorithmOfWeatherCount $algorithmOfWeatherCount');
  }


}