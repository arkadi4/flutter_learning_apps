

import 'package:flutter/material.dart';
import 'package:work_with_lists_1_common_task/random_user_generator.dart';

abstract class ArraysForThirdScreen {
  static List<Color> listWithSixColors = [Colors.yellow.shade200, Colors.red.shade200,
                      Colors.orange.shade200, Colors.green.shade200, Colors.blue.shade200, Colors.purple.shade200];
  static List<String> listWithSixTexts = ['First Card', 'Second Card',
                      'Third Card', 'Fourth Card', 'Fifth Card', 'Sixth Card'];
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 100,
          // mainAxisSpacing: 8,
          // crossAxisSpacing: 8,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            color: ArraysForThirdScreen.listWithSixColors[index % ArraysForThirdScreen.listWithSixColors.length],
            child: Stack(
              children: [
                Icon(
                  Icons.portrait,
                  size: 90,
                  color: Colors.grey.shade300,
                ),
                Positioned(
                  top: 60,
                  left: 15,
                  child: Text(
                    ArraysForThirdScreen.listWithSixTexts[index % ArraysForThirdScreen.listWithSixTexts.length],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
