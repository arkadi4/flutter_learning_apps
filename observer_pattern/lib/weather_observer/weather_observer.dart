
import 'dart:async';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';

class WeatherObserver with ChangeNotifier{
  WeatherObserver._privateConstructor();

  static final WeatherObserver instance = WeatherObserver._privateConstructor();

  factory WeatherObserver() {
    return instance;
  }

  bool isTimerRunning = false;
  int timeSinceEpoch = DateTime.now().secondsSinceEpoch % 35;
  Timer? timerWeatherObserver;

  void createTimerAndNotify() {
    timerWeatherObserver = Timer.periodic(const Duration(seconds: 3), (timer) {
      timeSinceEpoch = DateTime.now().secondsSinceEpoch % 35;
      notifyListeners();
    });
    isTimerRunning = true;
  }
}