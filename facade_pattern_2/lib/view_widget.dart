import 'dart:math';

import 'package:facade_pattern_2/user.dart';
import 'package:flutter/material.dart';

class ViewWidget extends StatefulWidget {
  ViewWidget({super.key});

  @override
  State<ViewWidget> createState() => _ViewWidgetState();
}

class _ViewWidgetState extends State<ViewWidget> {
  // List info = ['name', 'surname', 'age'];

  Future getInfoElement() async {

    // String result = '';
    // String xxx = User().getInfoFromJSON().then((value) {
    //   print('value $value');
    //   return value;
    // });

    // setState(() { });
    return User().getInfoFromJSON();
  }

  void getData() async {
    Future.delayed(Duration(seconds: 3),() {
      print('Ypa');
    });
    // print('Get data  print ${await getInfoElement()}');
    print('Get data print with then ${getInfoElement().then((value) => print('value in then $value'))}');
  }

  @override
  void initState() {
    // getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Column(
            children: [
              Text('User info'),
              Row(
                children: [
                  Text('User id:'),
                  Text('${User().id}'),
                ],
              ),
              Row(
                children: [
                  Text('User name:'),
                  Text('${  User().getInfoFromJSON().then((value) => value)}'),

                ],
              ),
              Row(
                children: [
                  Text('User surname:'),
                  Text('${User().name}'),
                ],
              ),
              Row(
                children: [
                  Text('User age:'),
                  Text('${User()}'),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: getInfoElement,
            child: Text(
              'Get information on user ${getInfoElement()}',
            ),
          ),
        ],
      ),
    );
  }
}
