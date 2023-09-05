

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_with_lists_1_common_task/random_user_generator.dart';
import 'package:work_with_lists_1_common_task/view_models/fifth_screen_view_model.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({super.key});

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    FifthScreenViewModel viewModel = context.watch<FifthScreenViewModel>();
    if (isLoading == true) {
      Future.delayed(Duration(seconds: 6), () {
        print('delay complete');
        setState(() {
          isLoading = false;
        });
      });
      return CircularProgressIndicator();
    }
    if (viewModel.doWeNeedEmptyList == true) {
      viewModel.doWeNeedEmptyList   = false;
      return RefreshIndicator(
        onRefresh: viewModel.refreshIndicatorCallback,
        child: ListView(
          children: [
            Text('There are no available users'),
          ]
        )
      );
    }
    return ListViewWidgetFromFirstScreen();
  }
}

class ListViewWidgetFromFirstScreen extends StatelessWidget {
  const ListViewWidgetFromFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // FifthScreenViewModel viewModel = context.watch<FifthScreenViewModel>();
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

