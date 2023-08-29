

import 'package:flutter/material.dart';

class ViewModelCustomView extends ChangeNotifier{
  Color color1 = Colors.black;
  Color color2 = Colors.red;
  Color color3 = Colors.pink;
  Color color4 = Colors.orange;
  Color color5 = Colors.yellow;
  Color color6 = Colors.greenAccent;
  Color color7 = Colors.green;
  Color color8 = Colors.blueAccent;
  Color color9 = Colors.blue;
  Color color10 = Colors.purple;

  int currentIndex = 4;
  late Color currentColor;
  late List<Color> listOfColors;

  ViewModelCustomView() {
    listOfColors = [color1, color2, color3, color4, color5, color6,
      color7, color8, color9, color10];
    currentColor = listOfColors[currentIndex];
  }

  previousButtonHandler(){
    if (currentIndex == 0) {
      currentIndex = (listOfColors.length-1);
    } else {
      currentIndex -= 1;
    }
    currentColor = listOfColors[currentIndex];
    notifyListeners();
  }

  nextButtonHandler(){
    if (currentIndex == (listOfColors.length-1) )  {
      currentIndex = 0;
    } else {
      currentIndex += 1;
    }
    currentColor = listOfColors[currentIndex];
    notifyListeners();
  }
}