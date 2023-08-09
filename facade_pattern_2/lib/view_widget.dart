import 'dart:math';

import 'package:flutter/material.dart';

class ViewWidget extends StatefulWidget {
  ViewWidget({super.key});

  @override
  State<ViewWidget> createState() => _ViewWidgetState();
}

class _ViewWidgetState extends State<ViewWidget> {
  List info = ['name', 'surname', 'age'];

  String getInfoElement() {
    int randomIndex = Random().nextInt(info.length);
    setState(() {

    });
    return '${info[randomIndex]} index $randomIndex';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: getInfoElement,
        child: Text(
          'Get information on user ${getInfoElement()}',
        ),
      ),
    );
  }
}
