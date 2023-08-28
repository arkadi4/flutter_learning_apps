

import 'package:flutter/material.dart';
import 'package:work_with_design_6_dynamic_ui/repository.dart';
import 'package:work_with_design_6_dynamic_ui/view_widget.dart';

class SecondScreen extends StatefulWidget {
   SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final Repositoty obj = Repositoty();
  int numberOfPicturesOnTheScreen = 1;

  addButtonHandler() {
    numberOfPicturesOnTheScreen += 1;
    obj.doWeNeedNewPicture = true;
    obj.getImageFromApi();
    setState(() {});
  }

  removeButtonHandler() {
    numberOfPicturesOnTheScreen -= 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                  itemCount: numberOfPicturesOnTheScreen,
                  itemBuilder: (context, index) {
                    print('obj.listOfPictures.length, ${obj.listOfPictures.length}');
                    print('index $index');
                    return ViewWidget();
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
                    onPressed: addButtonHandler,
                    child: Text('Add'),
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: ElevatedButton(
                    onPressed: removeButtonHandler,
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
