import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_with_lists_1_common_task/random_user_generator.dart';
import 'package:work_with_lists_1_common_task/screens/fifth_screen_widget.dart';
import 'package:work_with_lists_1_common_task/screens/first_screen_widget.dart';
import 'package:work_with_lists_1_common_task/screens/fourth_screen_widget.dart';
import 'package:work_with_lists_1_common_task/screens/second_screen_widget.dart';
import 'package:work_with_lists_1_common_task/screens/third_screen_widget.dart';
import 'package:work_with_lists_1_common_task/view_models/fifth_screen_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider.value(
      value: FifthScreenViewModel(),
      child: MyApp(),
    )
  );
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
      home: const MyHomePage(title: 'work with lists Home Page'),
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

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
    FourthScreen(),
    FifthScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }





  @override
  void initState() {
    super.initState();
    RandomUserGenerator.init();
  }

  @override
  Widget build(BuildContext context) {
    FifthScreenViewModel viewModel = context.watch<FifthScreenViewModel>();
    print('object in build ${RandomUserGenerator.usersList[0].lastName}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.first_page),
            label: 'First screen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.security_outlined),
            label: 'Second screen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thermostat),
            label: 'Third screen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.foundation),
            label: 'Fourth screen',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Icon(Icons.list),
                ElevatedButton(
                  onPressed: viewModel.deleteListButtonHandler,
                  child: Text(
                    'delete list',
                    style: TextStyle(
                      fontSize: 9,
                    ),
                  ),
                ),
              ],
            ),
            label: 'Fifth screen',
            // activeIcon: ElevatedButton(onPressed: () {}, child: Text('data')),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
