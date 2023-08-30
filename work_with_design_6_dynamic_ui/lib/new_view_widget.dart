

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_with_design_6_dynamic_ui/repository.dart';
import 'package:work_with_design_6_dynamic_ui/view_model.dart';

class NewViewWidget extends StatefulWidget {
  NewViewWidget({super.key});

  @override
  State<NewViewWidget> createState() => _NewViewWidgetState();
}

class _NewViewWidgetState extends State<NewViewWidget> {
  @override
  Widget build(BuildContext context) {
    ViewModel viewModel = context.watch<ViewModel>();
    print('viewModel.list in newviewwidget build ${viewModel.list}');
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
                future: viewModel.addPictureToList(),
                builder: (context, snapshot) {
                  print('viewModel.list ${viewModel.list}');
                  if (viewModel.list.length > viewModel.numberOfPicturesOnTheScreen)  print('overstack');
                  // print('viewModel.doWeNeedOneMorePicture ${viewModel.doWeNeedOneMorePicture}');
                  // print('context $context');
                  // print('snapshot.data ${snapshot.data}');
                  if (snapshot.hasData ) {
                    Repository().doWeNeedNewPicture = false;
                    // obj.doWeNeedNewPicture = false;
                    // print('obj.doWeNeedNewPicture in if state ${viewModel.doWeNeedOneMorePicture}');
                    return AnimatedOpacity(
                      duration: Duration(seconds: 2),
                      opacity: viewModel.alpha,
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
