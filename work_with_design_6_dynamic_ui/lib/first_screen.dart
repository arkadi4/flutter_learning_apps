

import 'package:flutter/material.dart';
import 'package:work_with_design_6_dynamic_ui/view_widget.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool _isVisible = true;

  void hideButtonHandler() {
    _isVisible = false;
    setState(() {});
  }

  void showButtonHandler() {
    _isVisible = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Visibility(
                visible: _isVisible,
                replacement: Center(
                  child: Text('hidden'),
                ),
                child: ViewWidget(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16,0,16,16),
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
