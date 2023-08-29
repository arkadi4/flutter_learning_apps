
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:work_with_design_6_dynamic_ui/repository.dart';

class ViewModelForSecondScreen with ChangeNotifier {
  final Repository repositoryObject = Repository();
  List<String> list = [];
  bool doWeNeedOneMorePicture = false;
  String picture = '---';

  Future<void> initViewModel() async {
    String initPicture = await repositoryObject.getInitPicture();

    list.add(initPicture);
    print('init list in init picture $list');
  }

  ViewModelForSecondScreen() {
    initViewModel();
    print('init list in constructor $list');
  }

  Future<void> addPictureToList() async {
    picture = await repositoryObject.getImageFromApi();
    list.add(picture);
    // print('list in addPictureToList $list');
    print('list in addPictureToList ${list.length}');
    // return picture;
  }

  int numberOfPicturesOnTheScreen = 1;

  addButtonHandler() async {
    Repository().doWeNeedNewPicture = true;
    await addPictureToList();
    print('list in addButtonHandler ${list.length}');
    numberOfPicturesOnTheScreen += 1;
    notifyListeners();
  }

  removeButtonHandler() {
    numberOfPicturesOnTheScreen -= 1;
    list.removeLast();
    notifyListeners();
  }
}