

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_with_design_6_dynamic_ui/repository.dart';
import 'package:work_with_design_6_dynamic_ui/view_model.dart';
import 'package:work_with_design_6_dynamic_ui/view_model_for_second_screen.dart';

class ViewForSecondScreen extends StatelessWidget {
   ViewForSecondScreen({super.key});

  final Future<String> future =  Repository().getImageFromApi();

  @override
  Widget build(BuildContext context) {
    ViewModelForSecondScreen viewModel = context.watch<ViewModelForSecondScreen>();
    // print('viewModel.list in ViewForSecondScreen build ${viewModel.list}');
    print('viewModel.list in ViewForSecondScreen build ${viewModel.list.length}');
    return Center(
      child: Container(
        width: 300,
        height: 300,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 300,
              height: 300,
              child: FutureBuilder(
                future: future,
                builder: (context, snapshot) {
                  // print('viewModel.list ${viewModel.list}');
                  print('viewModel.list.length in future builder ${viewModel.list.length}');
                  // if (viewModel.list.length > viewModel.numberOfPicturesOnTheScreen)  print('overstack');
                  // print('viewModel.doWeNeedOneMorePicture ${viewModel.doWeNeedOneMorePicture}');
                  // print('context $context');
                  print('snapshot ${snapshot.data}');
                  // if (snapshot.connectionState == ConnectionState.done ) {
                  if (snapshot.hasData ) {
                    Repository().doWeNeedNewPicture = false;
                    // obj.doWeNeedNewPicture = false;
                    viewModel.picture = snapshot.data!;
                    print('viewModel.picture after snaphot.hasdata ${viewModel.picture}');
                    return AnimatedOpacity(
                      duration: Duration(seconds: 2),
                      opacity: 1,
                      child: Image.network(
                        viewModel.picture,
                        fit: BoxFit.cover,
                      ),

                      // child: Image.asset(
                      //   viewModel.list[viewModel.list.length - 1],
                      //   fit: BoxFit.cover,
                      //   // opacity: FadeTransition(opacity: 1.0,),
                      // ),
                    );
                    // return Image.network(
                    //   obj.pictureUrl,
                    //   fit: BoxFit.cover,
                    // );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
