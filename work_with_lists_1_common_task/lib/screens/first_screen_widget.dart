

import 'package:flutter/material.dart';
import 'package:work_with_lists_1_common_task/random_user_generator.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: ListView.builder(
        itemCount: RandomUserGenerator.usersList.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  (RandomUserGenerator.usersList[index].sex == 'male') ? Icons.male : Icons.female,
                  size: 40.0,
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${RandomUserGenerator.usersList[index].firstName} '
                        '${RandomUserGenerator.usersList[index].lastName}',
                      ),
                      Text(
                        'Age: ${RandomUserGenerator.usersList[index].age}',
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16,),
                Image.network(
                  RandomUserGenerator.usersList[index].squareAvatarUrl,
                  width: 24,
                  height: 24,
                ),
              ],
            )
          );
        },
      ),
    );
  }
}
