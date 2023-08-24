import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:work_with_design_5_make_ui_layout/profile_class.dart';

import 'model.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   // statusBarColor: Colors.transparent,
    //   // statusBarIconBrightness: Brightness.light
    // )
    // );

    return MaterialApp(
      title: 'UI_by_screenshot',
      theme: ThemeData(
        textTheme: TextTheme(bodyMedium: TextStyle()).apply(
          bodyColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      // theme: Theme.of(context).textTheme.apply(
      //   bodyColor: Colors.pink,
      //   displayColor: Colors.pink,
      // );,
      home: HomePageWrapper(),
    );
  }
}

class HomePageWrapper extends StatefulWidget {
  const HomePageWrapper({super.key});

  @override
  State<HomePageWrapper> createState() => _HomePageWrapperState();
}

class _HomePageWrapperState extends State<HomePageWrapper> {
  @override
  Widget build(BuildContext context) {
    // return Container();
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: MyHomePage(title: 'UI_by_screenshot Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color colorInsteadOfImage = Colors.green.shade200;

  var model = Model();

  @override
  Widget build(BuildContext context) {
    context.watch<Model>();
    print('model $model');
    model.createList();
    model.createTimer();
    if (model.list == null) {
      print('kkkkkk');
    } else {
      print('model.list ${model.list![0].backgroundColor}');
    }
    Profile randomProfile = model.list![model.randomNumber];


    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [

        Container(
          color: randomProfile.backgroundColor,
        ),

        // Container(
        //   constraints: BoxConstraints.expand(),
        //   padding: EdgeInsets.fromLTRB(0, 0, 0, screenHeight * 0.5),
        //   color: Colors.grey,
        //   child: Container(
        //     child: Image.asset(
        //       './lib/assets/afonya_2.jpg',
        //       fit: BoxFit.fill,
        //     ),
        //   ),
        // ),

        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios),
                Icon(Icons.more_horiz),
              ],
            ),
          ),
          body: Center(
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${randomProfile.description}',
                    style: TextStyle(
                      fontSize: 20,

                    ),
                    // textAlign: TextAlign.left,
                  ),
                  SizedBox(height: screenHeight * 0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: screenHeight * 0.05,
                        backgroundColor: randomProfile.avatarColor,
                      ),
                      SizedBox(width: screenWidth * 0.02,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${randomProfile.name}'),
                            Text('${randomProfile.daysAgo} days ago'),
                          ],
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02,),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('+ Follow'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.orange),
                          foregroundColor: MaterialStatePropertyAll(Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: screenHeight * 0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('notRecognaized :'),
                      Text('${randomProfile.notRecognizedByMeNumber} someText'),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.25 * 0.2,
                            backgroundColor: Colors.red,
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.25 * 0.2,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.25 * 0.2,
                              backgroundColor: Colors.orange,
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.25 * 0.4,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.25 * 0.2,
                              backgroundColor: Colors.yellow,
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.25 * 0.6,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.25 * 0.2,
                              backgroundColor: Colors.green,
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.25 * 0.8,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.25 * 0.2,
                              backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
                              child: Text('${randomProfile.leftBottomCornerNumber}', style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.remove_red_eye_outlined, color: Colors.white,),
                              SizedBox(width: screenWidth * 0.005,),
                              Text('${randomProfile.numberOfViews}'),
                            ],
                          ),
                          SizedBox(width: screenWidth * 0.015,),
                          Row(
                            children: [
                              Icon(Icons.circle, color: Colors.white,),
                              SizedBox(width: screenWidth * 0.005,),
                              Text('${randomProfile.oneMoreNumber}'),
                            ],
                          ),
                          SizedBox(width: screenWidth * 0.015,),
                          Row(
                            children: [
                              Icon(Icons.heart_broken, color: Colors.white,),
                              SizedBox(width: screenWidth * 0.005,),
                              Text('${randomProfile.numberOfLikes}'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
