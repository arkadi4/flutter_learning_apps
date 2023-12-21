

import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';

class Ship with ChangeNotifier{
  // String goodsType = ['Bread', 'Banana', 'Clothes'][Random().nextInt(3)];
  // int capacity = [10, 20, 30][Random().nextInt(3)];
  // int shipNumber = 0;
  // String goodsType = '1111';
  // int capacity = 1111;
  // int shipNumber = 0;
  String goodsType;
  int capacity;
  int shipNumber;
  double speed;
  double distanceToTheTunnel;
  double progress = 0.0;
  String shipStatus = 'moving to tunnel';
  double tunnelLength = 100;
  double progressInTunnel = 0.0;

  Ship(
    {
      required this.shipNumber,
      required this.capacity,
      required this.goodsType,
      required this.speed,
      required this.distanceToTheTunnel
    }
  );

  move(nextStreamController)  {
    Timer.periodic(Duration(seconds: 1), (timer) {
      // print('tick ${timer.tick}');
      // print('speed ${event.speed}');
      // print('distanceToTheTunnel ${event.distanceToTheTunnel}');
      progress = (speed * timer.tick / distanceToTheTunnel ) * 100;
      if (progress < 100) {
        // print('progress ${event.progress}');
        // setState(() { });
      }
      if (progress >= 100) {
        progress = 100;
        shipStatus = 'reach the tunnel';
        // setState(() { });
        print('progress 100 shipNumber ${shipNumber}');
        nextStreamController.add(this);
        timer.cancel();
      }
    });
  }

  // createShipWithNumber() {
  //   shipNumber++;
  //   return Ship();
  // }

  // factory Ship.create() {
  //   // goodsType = ['Bread', 'Banana', 'Clothes'][Random().nextInt(3)];
  //   // capacity = 0;
  //   // shipNumber = shipNumber +1;
  //   return Ship();
  // }



  // String goodsType, int capacity
}

// Timer.periodic(Duration(seconds: 1), (timer) {
// // print('tick ${timer.tick}');
// // print('speed ${event.speed}');
// // print('distanceToTheTunnel ${event.distanceToTheTunnel}');
// ship.progress = (ship.speed * timer.tick / ship.distanceToTheTunnel ) * 100;
// if (ship.progress < 100) {
// // print('progress ${event.progress}');
// setState(() { });
// }
// if (ship.progress >= 100) {
// ship.progress = 100;
// ship.shipStatus = 'reach the tunnel';
// setState(() { });
// print('progress 100 shipNumber ${ship.shipNumber}');
// controllerTunnel.add(ship);
// timer.cancel();
// }
// });