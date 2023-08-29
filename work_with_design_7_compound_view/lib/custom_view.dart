

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_with_design_7_compound_view/view_model_custom_view.dart';

class CustomView extends StatelessWidget {
  const CustomView({super.key});



  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    ViewModelCustomView viewModel = context.watch<ViewModelCustomView>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Container(
                  width: screenSize/20,
                  color: viewModel.color1,
                ),
                Container(
                  width: screenSize/20,
                  color: viewModel.color2,
                ),
                Container(
                  width: screenSize/20,
                  color: viewModel.color3,
                ),
                Container(
                  width: screenSize/20,
                  color: viewModel.color4,
                ),
                Container(
                  width: screenSize/20,
                  color: viewModel.color5,
                ),
                SizedBox(width: screenSize/20,),
                Container(
                  width: screenSize *8 / 20,
                  color: viewModel.currentColor,
                ),
                SizedBox(width: screenSize/20,),
                Container(
                  width: screenSize/20,
                  color: viewModel.color6,
                ),
                Container(
                  width: screenSize/20,
                  color: viewModel.color7,
                ),
                Container(
                  width: screenSize/20,
                  color: viewModel.color8,
                ),
                Container(
                  width: screenSize/20,
                  color: viewModel.color9,
                ),
                Container(
                  width: screenSize/20,
                  color: viewModel.color10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: viewModel.previousButtonHandler, child: const Text("Previous")),
                  const SizedBox(width: 20,),
                  FittedBox(
                    child: Text(
                      "Current value:\n RGB(${viewModel.currentColor.red}, ${viewModel.currentColor.green}, ${viewModel.currentColor.blue})",
                      maxLines: 5,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  ElevatedButton(onPressed: viewModel.nextButtonHandler, child: const Text("Next")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
