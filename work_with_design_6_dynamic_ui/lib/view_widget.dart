

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_with_design_6_dynamic_ui/repository.dart';
import 'package:work_with_design_6_dynamic_ui/view_model.dart';

class ViewWidget extends StatelessWidget {
  ViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ViewModel viewModel = context.watch<ViewModel>();
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: viewModel.alpha,
          child: SizedBox(
            width: 300,
            height: 300,
            child: Image.network(viewModel.list[0], fit: BoxFit.fill,),
          ),
        ),
      ),
    );
  }
}

// child: (!viewModel.isLoading)
//     ? Image.network(viewModel.list[index])
//     : const CircularProgressIndicator(),

// child: FutureBuilder(
//   future: obj.getImageFromApi(),
//   builder: (context, snapshot) {
//     print('obj.pictureUrl ${obj.pictureUrl}');
//     print('obj.doWeNeedNewPicture ${obj.doWeNeedNewPicture}');
//     print('context $context');
//     print('snapshot.data ${snapshot.data}');
//     if (snapshot.hasData ) {
//       obj.doWeNeedNewPicture = false;
//       // obj.doWeNeedNewPicture = false;
//       print('obj.doWeNeedNewPicture in if state ${obj.doWeNeedNewPicture}');
//       return Image.asset(
//         obj.pictureUrl,
//         fit: BoxFit.cover,
//       );
//       // return Image.network(
//       //   obj.pictureUrl,
//       //   fit: BoxFit.cover,
//       // );
//     } else {
//       // obj.getImageFromApi();
//       return CircularProgressIndicator();
//     }
//   },
// ),