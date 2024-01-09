import 'dart:math';
import 'package:ships_tonnels_goods/ship_object.dart';

abstract class ShipManagement {
  static List<Ship> shipsListGlobal = [];
  static List<Ship> shipsInTunnel = [];
  static List<Ship> queueBeforeTunnel = [];
  static List<Ship> queueBread = [];
  static bool isBreadDockBusy = false;
  static List<Ship> queueBanana = [];
  static bool isBananaDockBusy = false;
  static List<Ship> queueClothes = [];
  static bool isClothesDockBusy = false;

  static Ship returnSameShip(Ship ship) {
    Ship newship = Ship(shipNumber: ship.shipNumber, capacity: ship.capacity,
                        goodsType: ship.goodsType, speed: ship.speed,
                        distanceToTheTunnel: ship.distanceToTheTunnel,
                        progressInSea: ship.progressInSea, shipStatus: ship.shipStatus,
                        progressInTunnel: ship.progressInTunnel, loadingProgress: ship.loadingProgress);
    return newship;
  }

  static List<Ship> returnListWithSameShips(List<Ship> list) {
    List<Ship> newList = [];
    for (var i = 0; i < list.length; i++) {
      var ship = Ship(shipNumber: list[i].shipNumber,
          capacity: list[i].capacity,
          goodsType: list[i].goodsType,
          speed: list[i].speed,
          distanceToTheTunnel: list[i].distanceToTheTunnel,
          progressInSea: list[i].progressInSea, shipStatus: list[i].shipStatus,
          progressInTunnel: list[i].progressInTunnel,
          loadingProgress: list[i].loadingProgress);
      newList.add(ship);
    }
    return newList;
  }

  static List<Ship> createRandomShipsForTry3() {
    List<Ship> shipList = [];
    int n = 30 - Random().nextInt(20);
    for (var i=0; i<n; i++) {
      Ship ship = Ship(
        shipNumber: i+1,
        goodsType: ['Bread', 'Banana', 'Clothes'][Random().nextInt(3)],
        capacity: [10, 50, 100][Random().nextInt(3)],
        speed: 10 - Random().nextDouble() * 5,
        distanceToTheTunnel: 80 - Random().nextDouble() * 50,
        progressInSea: 0.0, shipStatus: 'generated',
        progressInTunnel: 0.0,
        loadingProgress: 0.0,
      );
      shipList.add(ship);
    }
    return shipList;
  }
}