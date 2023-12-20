

import 'dart:async';
import 'dart:math';

class Ship {
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

  move()  {
    Timer.periodic(Duration(seconds: 1), (timer) {
      print('tick ${timer.tick}');
      print('speed ${speed}');
      print('distanceToTheTunnel ${distanceToTheTunnel}');
      progress = (speed * timer.tick / distanceToTheTunnel ) * 100;
      print('progress ${progress}');
      if (timer.tick > 5) {
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