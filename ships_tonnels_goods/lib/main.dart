import 'package:flutter/material.dart';
import 'home_screen_widget_try_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreenTry3(title: 'Ships, tunnels, goods'),
    );
  }
}




///////////////////////////////////// set state

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   // StreamController<Ship> controllerMoveBeforeTunnel = StreamController();
//   // StreamController<Ship> controllerMoveInTunnel = StreamController();
//   // StreamController<Ship> controllerBreadDock = StreamController();
//   // StreamController<Ship> controllerBananaDock = StreamController();
//   // StreamController<Ship> controllerClothesDock = StreamController();
//
//   @override
//   void initState() {
//     super.initState();
//     // ShipManagement.createRandomShips(shipList, controllerMoveBeforeTunnel);
//   }

// controllerMoveBeforeTunnel.stream.listen((ship) {
//   Timer.periodic(Duration(seconds: 1), (timer) {
//     // print('tick ${timer.tick}');
//     ship.progress = ((ship.speed * timer.tick / ship.distanceToTheTunnel ) * 100);
//     // ship.progress = double.parse(((ship.speed * timer.tick / ship.distanceToBreadDock ) * 100).toStringAsFixed(1));
//     if (ship.progress < 100) {
//       setState(() { });
//     }
//     if (ship.progress >= 100) {
//       ship.progress = 100.0;
//       ship.shipStatus = 'reach the tunnel';
//       setState(() { });
//       print('progress 100 shipNumber ${ship.shipNumber}');
//       if (shipsInTheTunnel.length < 5) {
//         shipsInTheTunnel.add(ship);
//         controllerMoveInTunnel.add(ship);
//       } else {
//         queueBeforeTheTunnel.add(ship);
//         ship.shipStatus = 'waiting in queue';
//         setState(() { });
//       }
//       timer.cancel();
//     }
//   });
// });
//
// controllerMoveInTunnel.stream.listen((ship) {
//   ship.shipStatus = 'moving in the tunnel';
//   Timer.periodic(Duration(seconds: 1), (timer) {
//     ship.progressInTunnel = (ship.speed * timer.tick / ship.tunnelLength ) * 100;
//     if (ship.progressInTunnel < 100) {
//       setState(() { });
//     }
//     if (ship.progressInTunnel >= 100) {
//       ship.progressInTunnel = 100.0;
//       ship.shipStatus = 'finish the tunnel';
//       setState(() { });
//       print('progressInTunnel 100 shipNumber ${ship.shipNumber}');
//       shipsInTheTunnel.remove(ship);
//       if (queueBeforeTheTunnel.length > 0) {
//         controllerMoveInTunnel.add(queueBeforeTheTunnel[0]);
//         print('queueBeforeTheTunnel ${queueBeforeTheTunnel}');
//         queueBeforeTheTunnel.removeAt(0);
//         print('queueBeforeTheTunnel ${queueBeforeTheTunnel}');
//       }
//       if (ship.goodsType == 'Bread') {
//         if (isBreadDockBusy == false) {
//           isBreadDockBusy = true;
//           controllerBreadDock.add(ship);
//         } else {
//           ship.shipStatus = 'waiting in dock queue';
//           queueLoadingBread.add(ship);
//         }
//       } else if (ship.goodsType == 'Banana') {
//         if (isBananaDockBusy == false) {
//           isBananaDockBusy = true;
//           controllerBananaDock.add(ship);
//         } else {
//           ship.shipStatus = 'waiting in dock queue';
//           queueLoadingBanana.add(ship);
//         }
//       } else if (ship.goodsType == 'Clothes') {
//         if (isClothesDockBusy == false) {
//           isClothesDockBusy = true;
//           controllerClothesDock.add(ship);
//         } else {
//           ship.shipStatus = 'waiting in dock queue';
//           queueLoadingClothes.add(ship);
//         }
//       }
//       timer.cancel();
//     }
//   });
// });
//
// controllerBreadDock.stream.listen((ship) {
//   ship.shipStatus = 'moving to ${ship.goodsType.toLowerCase()} dock';
//
//   // moveToDockAndLoadGoods(ship, ship.progressBreadLoading, ship.distanceToBreadDock,
//   //     ship.goodsType, ship.progressLoading, isBreadDockBusy, controllerBreadDock, queueLoadingBread);
//
//   Timer.periodic(Duration(seconds: 1), (timer) {
//     ship.progressToBreadDock = (ship.speed * timer.tick / ship.distanceToBreadDock ) * 100;
//     if (ship.progressToBreadDock < 100) {
//       setState(() { });
//     }
//     if (ship.progressToBreadDock >= 100) {
//       ship.progressToBreadDock = 100.0;
//       ship.shipStatus = 'loading bread';
//       ship.progressLoading = (ship.loadingSpeed * timer.tick / ship.capacity ) * 100;
//       if (ship.progressLoading < 100) {
//         setState(() { });
//       }
//       if (ship.progressLoading >= 100) {
//         ship.progressLoading = 100.0;
//         ship.shipStatus = 'done';
//         isBreadDockBusy = false;
//         if (queueLoadingBread.isNotEmpty) {
//           controllerBreadDock.add(queueLoadingBread[0]);
//           queueLoadingBread.removeAt(0);
//         }
//         timer.cancel();
//       }
//     }
//   });
// });
//
//
// controllerBananaDock.stream.listen((ship) {
//   ship.shipStatus = 'moving to ${ship.goodsType.toLowerCase()} dock';
//
//   // moveToDockAndLoadGoods(ship, ship.progressBreadLoading, ship.distanceToBreadDock,
//   //     ship.goodsType, ship.progressLoading, isBreadDockBusy, controllerBreadDock, queueLoadingBread);
//
//   Timer.periodic(Duration(seconds: 1), (timer) {
//     ship.progressToBananaDock = (ship.speed * timer.tick / ship.distanceToBananaDock ) * 100;
//     if (ship.progressToBananaDock < 100) {
//       setState(() { });
//     }
//     if (ship.progressToBananaDock >= 100) {
//       ship.progressToBananaDock = 100.0;
//       ship.shipStatus = 'loading banana';
//       ship.progressLoading = (ship.loadingSpeed * timer.tick / ship.capacity ) * 100;
//       if (ship.progressLoading < 100) {
//         setState(() { });
//       }
//       if (ship.progressLoading >= 100) {
//         ship.progressLoading = 100.0;
//         ship.shipStatus = 'done';
//         isBananaDockBusy = false;
//         if (queueLoadingBanana.isNotEmpty) {
//           controllerBananaDock.add(queueLoadingBanana[0]);
//           queueLoadingBanana.removeAt(0);
//         }
//         timer.cancel();
//       }
//     }
//   });
// });
//
// controllerClothesDock.stream.listen((ship) {
//   ship.shipStatus = 'moving to ${ship.goodsType.toLowerCase()} dock';
//
//   Timer.periodic(Duration(seconds: 1), (timer) {
//     ship.progressToClothesDock = (ship.speed * timer.tick / ship.distanceToClothesDock ) * 100;
//     if (ship.progressToClothesDock < 100) {
//       setState(() { });
//     }
//     if (ship.progressToClothesDock >= 100) {
//       ship.progressToClothesDock = 100.0;
//       ship.shipStatus = 'loading clothes';
//       ship.progressLoading = (ship.loadingSpeed * timer.tick / ship.capacity ) * 100;
//       if (ship.progressLoading < 100) {
//         setState(() { });
//       }
//       if (ship.progressLoading >= 100) {
//         ship.progressLoading = 100.0;
//         ship.shipStatus = 'done';
//         isClothesDockBusy = false;
//         if (queueLoadingClothes.isNotEmpty) {
//           controllerClothesDock.add(queueLoadingClothes[0]);
//           queueLoadingClothes.removeAt(0);
//         }
//         timer.cancel();
//       }
//     }
//   });
// });
