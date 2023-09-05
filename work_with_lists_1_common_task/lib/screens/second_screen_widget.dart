

import 'package:flutter/material.dart';
import 'package:work_with_lists_1_common_task/random_user_generator.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: ListView.builder(
        itemCount: RandomUserGenerator.usersList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    (RandomUserGenerator.usersList[index].sex == 'male') ? Icons.male : Icons.female,
                    size: 46.0,
                  ),
                ),
                // SizedBox(width: 16,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,12,0,16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${RandomUserGenerator.usersList[index].firstName} '
                              '${RandomUserGenerator.usersList[index].lastName}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            // height: 2.0,
                            // textBaseline: TextBaseline.values.first
                          ),
                        ),
                        Text(
                          'Age: ${RandomUserGenerator.usersList[index].age}',
                        ),
                        Text(
                          '${RandomUserGenerator.usersList[index].description}',
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(width: 16,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.network(
                    RandomUserGenerator.usersList[index].squareAvatarUrl,
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            )
          );
        },
      ),
    );
  }
}
