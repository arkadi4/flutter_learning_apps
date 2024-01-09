
import 'package:flutter/cupertino.dart';
import 'package:ships_tonnels_goods/ship_object.dart';

class ViewModel with ChangeNotifier {

  List<Ship> shipList = [];

  // ViewModel();

  move(Ship ship) {
    ship.shipNumber++;
    notifyListeners();
  }

  notify(shipList) {
    notifyListeners();
  }
}