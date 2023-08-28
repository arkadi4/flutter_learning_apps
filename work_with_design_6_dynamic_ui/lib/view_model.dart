

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:work_with_design_6_dynamic_ui/repository.dart';

class ViewModel with ChangeNotifier {
  final Repositoty repositoryObject = Repositoty();
  List<String> list = [];
  bool doWeNeedOneMorePicture = false;
  double alpha = 1.0;

  void initViewModel() async {
    await repositoryObject.getImageFromApi();
    list.add(repositoryObject.pictureUrl);
  }

  ViewModel() {
    initViewModel();
  }

  Future<String> addPictureToList() async {
    await repositoryObject.getImageFromApi();
    list.add(repositoryObject.pictureUrl);
    return repositoryObject.pictureUrl;
  }

  addAlphaButtonHandler(){
    alpha = min(1, alpha + 0.1 );
    print('alpha $alpha');
    notifyListeners();
  }

  removeAlphaButtonHandler() {
    alpha = max(0, alpha - 0.1);
    print('alpha $alpha');
    notifyListeners();
  }
}