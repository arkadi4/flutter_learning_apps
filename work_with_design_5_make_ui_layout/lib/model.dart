import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:work_with_design_5_make_ui_layout/model_creator.dart';
import 'package:work_with_design_5_make_ui_layout/profile_class.dart';

class Model with ChangeNotifier{
  List<Profile> list = [TenRandomProfiles().roman, TenRandomProfiles().mihail, TenRandomProfiles().egor,
                        TenRandomProfiles().vasilii, TenRandomProfiles().iakov, TenRandomProfiles().victor,
                        TenRandomProfiles().semen, TenRandomProfiles().afanasii, TenRandomProfiles().ivan,
                        TenRandomProfiles().petr];
  Profile randomUser = TenRandomProfiles().roman;
  bool isTimerActive = false;

  createTimer() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      randomUser = list[Random().nextInt(list.length)];
      print('randomuser ${randomUser.name}');
      notifyListeners();
    });
  }
}