

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_with_design_6_dynamic_ui/new_view_widget.dart';
import 'package:work_with_design_6_dynamic_ui/repository.dart';
import 'package:work_with_design_6_dynamic_ui/second_screen_view.dart';
import 'package:work_with_design_6_dynamic_ui/view_model.dart';
import 'package:work_with_design_6_dynamic_ui/view_model_for_second_screen.dart';
import 'package:work_with_design_6_dynamic_ui/view_widget.dart';

class SecondScreen extends StatefulWidget {
   SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  final Future<String> future =  Repository().getImageFromApi();

  @override
  Widget build(BuildContext context) {
    ViewModelForSecondScreen viewModel = context.watch<ViewModelForSecondScreen>();
    // print('viewModel.list in build ${viewModel.list}');
    print('viewModel.list in build ${viewModel.list.length}');
    return Scaffold(
      appBar: AppBar(title: Text('Second screen'),),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB( (MediaQuery.of(context).size.width-300)/2, 0, 0, 0),
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // itemCount: obj.listOfPictures.length,
                  itemCount: viewModel.numberOfPicturesOnTheScreen,
                  itemBuilder: (context, index) {
                    print('viewModel.list in item builder ${viewModel.list.length}');
                    print('index in item builder $index');

                    // return Container(
                    //   width: 100,
                    //   height: 100,
                    //   child: FutureBuilder(
                    //     future: future,
                    //     builder: (context, snapshot) {
                    //       if (snapshot.hasData) {
                    //         return Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Image.network(viewModel.list[index]),
                    //         );
                    //       } else {
                    //         return CircularProgressIndicator();
                    //       }
                    //     }
                    //   ),
                    // );

                    return Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(viewModel.list[index]),
                      ),
                    );

                  // return ViewForSecondScreen();
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16,0,16,16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: viewModel.addButtonHandler,
                    child: Text('Add'),
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: viewModel.removeButtonHandler,
                    child: Text('Remove'),
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

