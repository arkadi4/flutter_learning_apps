

import 'package:flutter/material.dart';
import 'package:work_with_design_6_dynamic_ui/view_widget.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool _isVisible = true;
  double opacity = 1;

  void hideButtonHandler() {
    _isVisible = false;
    opacity = 0;
    setState(() {});
  }

  void showButtonHandler() {
    _isVisible = true;
    opacity = 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              // child: Stack(
              //   children: [
              //     Text('hidden'),
              //     Container(
              //       color: Color.fromRGBO(255, 0, 0, opacity),
              //     ),
              //   ],
              // ),
              child: Visibility(
                visible: _isVisible,
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
                replacement: Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                  child: Text('yyyyyyyyyyyyyy'),
                ),
                child: ViewWidget(),
              ),
            ),
          ),
          Padding(
            // padding: const EdgeInsets.fromLTRB(16,0,16,16),
            padding: const EdgeInsets.fromLTRB(0,0,0,0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: hideButtonHandler,
                    child: Text('Hide'),
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: showButtonHandler,
                    child: Text('Show'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
