

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_with_design_6_dynamic_ui/new_view_widget.dart';
import 'package:work_with_design_6_dynamic_ui/view_model.dart';
import 'package:work_with_design_6_dynamic_ui/view_widget.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {


  @override
  Widget build(BuildContext context) {
    ViewModel viewModel = context.watch<ViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('First screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Visibility(
                visible: viewModel.isVisible,
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
                    onPressed: viewModel.hideButtonHandler,
                    child: Text('Hide'),
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: viewModel.showButtonHandler,
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
