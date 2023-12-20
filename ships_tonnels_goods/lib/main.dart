import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:ships_tonnels_goods/ship_object.dart';

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
      home: const MyHomePage(title: 'Ships, tunnels, goods'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Ship> shipList = [];
  List<Ship> shipsInTheTunnel = [];
  List<Ship> queueBeforeTheTunnel = [];
  var controllerGenerateAndMove = StreamController<Ship>();
  var controllerTunnel = StreamController<Ship>();

  createRandomShips() {
    for (var i=0; i<10; i++) {
      Ship ship = Ship(
        shipNumber: i+1,
        goodsType: ['Bread', 'Banana', 'Clothes'][Random().nextInt(3)],
        capacity: [10, 20, 30][Random().nextInt(3)],
        speed: 10 - Random().nextDouble() * 5,
        distanceToTheTunnel: 80 - Random().nextDouble() * 50,
      );
      shipList.add(ship);
      controllerGenerateAndMove.add(ship);
    }
  }

  @override
  void initState() {
    super.initState();
    createRandomShips();
    controllerGenerateAndMove.stream.listen((ship) {
      // print(event.distanceToTheTunnel);
      Timer.periodic(Duration(seconds: 1), (timer) {
        // print('tick ${timer.tick}');
        // print('speed ${event.speed}');
        // print('distanceToTheTunnel ${event.distanceToTheTunnel}');
        ship.progress = (ship.speed * timer.tick / ship.distanceToTheTunnel ) * 100;
        if (ship.progress < 100) {
          // print('progress ${event.progress}');
          setState(() { });
        }
        if (ship.progress >= 100) {
          ship.progress = 100;
          ship.shipStatus = 'reach the tunnel';
          setState(() { });
          print('progress 100 shipNumber ${ship.shipNumber}');

          controllerTunnel.add(ship);
          timer.cancel();
        }
      });
    });
    controllerTunnel.stream.listen((ship) {
      if (shipsInTheTunnel.length < 5 ) {
        shipsInTheTunnel.add(ship);
        print('shipsInTheTunnel ${shipsInTheTunnel}');
        ship.shipStatus = 'moving in the tunnel';
        // move
        Timer.periodic(Duration(seconds: 1), (timer) {

          // print('speed ${event.speed}');
          // print('distanceToTheTunnel ${event.distanceToTheTunnel}');
          ship.progressInTunnel = (ship.speed * timer.tick / ship.tunnelLength ) * 100;
          if (ship.progressInTunnel < 100) {
            // print('progress ${event.progress}');
            setState(() { });
          }
          if (ship.progressInTunnel >= 100) {
            ship.progressInTunnel = 100;
            ship.shipStatus = 'finish the tunnel';
            setState(() { });
            // remove from shipsInTunnel
            print('progressInTunnel 100 shipNumber ${ship.shipNumber}');
            timer.cancel();
          }
        });
      } else {
        queueBeforeTheTunnel.add(ship);
        print('queueBeforeTheTunnel ${queueBeforeTheTunnel}');
      }
      // shipsInTheTunnel.add(ship);
      // print('ship queue ${shipsInTheTunnel}');

    });
  }


  @override
  Widget build(BuildContext context) {
    // print('build print' );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Expanded(
              child: ListView.builder(
                  itemCount: shipList.length,
                  itemBuilder: (BuildContext buildContext, int count) {
                    // print('Ship number ${shipList[count].shipNumber}');
                    return Card(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ship number: ${shipList[count].shipNumber}'),
                          Text('Goods type: ${shipList[count].goodsType}'),
                          Text('Capacity: ${shipList[count].capacity}'),
                          Text('Speed: ${shipList[count].speed}'),
                          Text('Distance to the tunnel: ${shipList[count].distanceToTheTunnel}'),
                          Text('Progress to the tunnel: ${shipList[count].progress}'),
                          Text('Progress in tunnel: ${shipList[count].progressInTunnel}'),
                          Text('Ship status: ${shipList[count].shipStatus}'),
                        ],
                      ),
                    );
                  }
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: shipList.length,
            //     itemBuilder: (BuildContext buildContext, int count) {
            //       // print('Ship number ${shipList[count].shipNumber}');
            //       return Card(
            //         child: Column(
            //           // mainAxisAlignment: MainAxisAlignment.start,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text('Ship number: ${shipList[count].shipNumber}'),
            //             Text('Goods type: ${shipList[count].goodsType}'),
            //             Text('Capacity: ${shipList[count].capacity}'),
            //             Text('Speed: ${shipList[count].speed}'),
            //             Text('Distance to the tunnel: ${shipList[count].distanceToTheTunnel}'),
            //           ],
            //         ),
            //       );
            //     }
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// Text('${ship1.shipNumber}'),
// Text('some text'),
// ElevatedButton(
//   onPressed: () {
//     shipList = [];
//     createRandomShips();
//     print('shipList ${shipList[2].shipNumber}');
//     print('shipList ${shipList[2].goodsType}');
//     setState(() { });
//   },
//   child: Text('crete ship')
// ),

// Expanded(
//   child: StreamBuilder<Ship>(
//     // initialData: Text('Waiting for ships'),
//     stream: controllerWaitAtTheEntrance.stream,
//     builder: (BuildContext context, AsyncSnapshot snapshot) {
//       if (snapshot.hasData) {
//         print('Stream 2 snapshot ${snapshot.data.shipNumber}');
//         shipQueueBeforeTunnel.add(snapshot.data);
//         return Text('Stream 2 shipQueueBeforeTunnel ${shipQueueBeforeTunnel}'
//                       );
//       } else {
//         return Text('Waiting for ships');
//       }
//     }
//   ),
// ),
// Text('First five ships in queue before the tunnel ${shipQueueBeforeTunnel}'),