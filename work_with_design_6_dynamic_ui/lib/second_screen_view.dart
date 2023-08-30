

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_with_design_6_dynamic_ui/repository.dart';
import 'package:work_with_design_6_dynamic_ui/view_model.dart';
import 'package:work_with_design_6_dynamic_ui/view_model_for_second_screen.dart';

class ViewForSecondScreen extends StatefulWidget {
  int index;
   ViewForSecondScreen({super.key, required this.index});

  @override
  State<ViewForSecondScreen> createState() => _ViewForSecondScreenState();
}

class _ViewForSecondScreenState extends State<ViewForSecondScreen> {



  final Future<String> future =  Repository().getImageFromApi();
  @override
  void initState() {

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    ViewModelForSecondScreen viewModel = context.watch<ViewModelForSecondScreen>();

    // print('viewModel.list in ViewForSecondScreen build ${viewModel.list}');
    print('viewModel.list in ViewForSecondScreen build ${viewModel.list.length}');
    return Center(
      child: Container(
        width: 100,
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 100,
              height: 100,
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
                    // Repository().doWeNeedNewPicture = false;
                    // obj.doWeNeedNewPicture = false;
                    // viewModel.picture = snapshot.data!;
                    print('viewModel.picture after snaphot.hasdata ${viewModel.picture}');
                    // return AnimatedOpacity(
                    //   duration: Duration(seconds: 2),
                    //   opacity: 1,
                    //   child: Image.network(
                    //     viewModel.picture,
                    //     fit: BoxFit.cover,
                    //   ),
                    //  );

                      // return Image.asset(
                      //   snapshot.data!,
                      //   fit: BoxFit.cover,
                      //   // opacity: FadeTransition(opacity: 1.0,),
                      // );

                    // return Image.network(
                    //   viewModel.list[widget.index], // viewModel.list.length - 1
                    //   fit: BoxFit.cover,
                    // );

                    return Container();
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
