

import 'package:flutter/material.dart';
import 'package:work_with_lists_1_common_task/random_user_generator.dart';

class FifthScreenViewModel extends ChangeNotifier {
  List viewModelUserList = RandomUserGenerator.usersList;
  bool doWeNeedEmptyList = false;

  Future<void> refreshIndicatorCallback() async {
    await Future.delayed(Duration(seconds: 3), () {
      doWeNeedEmptyList = false;
      notifyListeners();
    });

  }

  void deleteListButtonHandler() {
    doWeNeedEmptyList = true;
    notifyListeners();
  }
}