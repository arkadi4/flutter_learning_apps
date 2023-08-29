

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_with_design_6_dynamic_ui/new_view_widget.dart';
import 'package:work_with_design_6_dynamic_ui/view_model.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {

    ViewModel viewModel = context.watch<ViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('third screen'),),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: NewViewWidget(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16,0,16,16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: viewModel.addAlphaButtonHandler,
                    child: const Text('Add alpha'),
                  ),
                ),
                const SizedBox(width: 16,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: viewModel.removeAlphaButtonHandler,
                    child: const Text('Remove alpha'),
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
