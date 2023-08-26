import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        textTheme: const TextTheme(bodyMedium: TextStyle()).apply(
          bodyColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const HomePageWrapper(),
    );
  }
}

class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // final String title;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    if (context.watch<Model>().isTimerActive == false) {
      Future.delayed(Duration(seconds: 5), context.watch<Model>().createTimer());
      context.watch<Model>().isTimerActive = true;
    }
    return Stack(
      children: [
        Container(
          color: context.watch<Model>().randomUser.backgroundColor,
        ),

        /////////////////////////////// image try
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
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios),
                Icon(Icons.more_horiz),
              ],
            ),
          ),
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    context.watch<Model>().randomUser.description,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: screenHeight * 0.05,
                        backgroundColor: context.watch<Model>().randomUser.avatarColor,
                      ),
                      SizedBox(width: screenWidth * 0.02,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${context.watch<Model>().randomUser.name}'),
                            Text('${context.watch<Model>().randomUser.daysAgo} days ago'),
                          ],
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02,),
                      ElevatedButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.orange),
                          foregroundColor: MaterialStatePropertyAll(Colors.white),
                        ),
                        child: const Text('+ Follow'),
                      ),
                    ],
                  ),
                  Divider(height: screenHeight * 0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('notRecognaized :'),
                      Text('${context.watch<Model>().randomUser.notRecognizedByMeNumber} someText'),
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
                              backgroundColor: const Color.fromRGBO(255, 255, 255, 0.5),
                              child: Text('+${context.watch<Model>().randomUser.leftBottomCornerNumber}', style: const TextStyle(color: Colors.white),),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.remove_red_eye_outlined, color: Colors.white,),
                              SizedBox(width: screenWidth * 0.005,),
                              Text('${context.watch<Model>().randomUser.numberOfViews}'),
                            ],
                          ),
                          SizedBox(width: screenWidth * 0.015,),
                          Row(
                            children: [
                              const Icon(Icons.circle, color: Colors.white,),
                              SizedBox(width: screenWidth * 0.005,),
                              Text('${context.watch<Model>().randomUser.oneMoreNumber}'),
                            ],
                          ),
                          SizedBox(width: screenWidth * 0.015,),
                          Row(
                            children: [
                              const Icon(Icons.heart_broken, color: Colors.white,),
                              SizedBox(width: screenWidth * 0.005,),
                              Text('${context.watch<Model>().randomUser.numberOfLikes}'),
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
