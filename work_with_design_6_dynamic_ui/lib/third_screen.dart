

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_with_design_6_dynamic_ui/new_view_widget.dart';
import 'package:work_with_design_6_dynamic_ui/view_model.dart';
import 'package:work_with_design_6_dynamic_ui/view_widget.dart';

// class  extends StatelessWidget {
//   const ({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }


class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});



  @override
  Widget build(BuildContext context) {

    ViewModel viewModel = context.watch<ViewModel>();
    print('view model list ${viewModel.alpha}');
    return Scaffold(
      appBar: AppBar(title: Text('third screen'),),
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
                    child: Text('Add alpha'),
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: viewModel.removeAlphaButtonHandler,
                    child: Text('Remove alpha'),
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
