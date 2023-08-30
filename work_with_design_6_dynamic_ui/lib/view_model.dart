
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:work_with_design_6_dynamic_ui/repository.dart';

class ViewModel with ChangeNotifier {
  final Repository repositoryObject = Repository();
  List<String> list = [];
  bool doWeNeedOneMorePicture = false;
  double alpha = 1.0;
  bool isVisible = true;
  bool isLoading = false;
  String picture = '---';

  void initViewModel() async {
    String initPicture = await repositoryObject.getInitPicture();
    list.add(initPicture);
  }

  ViewModel() {
    initViewModel();
    print('init list $list');
  }

  Future<String> addPictureToList() async {
    picture = await repositoryObject.getImageFromApi();
    list.add(picture);
    return picture;
  }

  //////////////////////////////////   second screen
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

  //////////////////////////////////   third screen
  addAlphaButtonHandler() {
    alpha = max(0, alpha - 0.1);

    notifyListeners();
  }

  removeAlphaButtonHandler() {
    alpha = min(1, alpha + 0.1 );
    notifyListeners();
  }

  //////////////////////////////////   first screen
  void hideButtonHandler() {
    isVisible = false;
    notifyListeners();
  }

  void showButtonHandler() {
    isVisible = true;
    notifyListeners();
  }
}