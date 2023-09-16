

import 'package:application_lifecycle/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewModel extends ChangeNotifier with WidgetsBindingObserver {
  int label = 0;

  Future<void> readLabelFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    label = prefs.getInt('label') ?? 0;
    notifyListeners();
  }

  Future<void> updateButtonHandler(context) async {
    label += 10;
    Repository.saveValue(label);
    notifyListeners();
    Navigator.of(context).pop();
  }

  Future<void> increaseWhenInactive() async {
    label += 5;
    Repository.saveValue(label);
  }

  Future<void> increaseWhenResume() async {
    label += 2;
  }

  Future<void> countLabelAfterTimeDifference(int difference) async {
    label -= difference;
    notifyListeners();
  }
}