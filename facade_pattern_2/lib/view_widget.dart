import 'dart:math';

import 'package:facade_pattern_2/user.dart';
import 'package:facade_pattern_2/user_manager.dart';
import 'package:flutter/material.dart';

import 'api_manager.dart';

class ViewWidget extends StatefulWidget {
  ViewWidget({super.key});

  @override
  State<ViewWidget> createState() => _ViewWidgetState();
}

class _ViewWidgetState extends State<ViewWidget> {

  String? name;
  UserManager userManager = UserManager();

  void getData() async {

    User? userInViewWidget = await userManager.getInfoOnUser();
    print('userInViewWidget $userInViewWidget');

    setState(() {
      if (userInViewWidget == null) {
        name = 'null';
      } else {
        name = userInViewWidget.name;
      }
    });
  }

  @override
  void initState() {
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
                  Text('$name'),
                  // Text('${  User().display().then((value) => value)}'),

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
                  Text('${User().name}'),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: getData,
            child: Text(
              'Get information ... ${name}', // ${getInfoElement()}
            ),
          ),
        ],
      ),
    );
  }
}
