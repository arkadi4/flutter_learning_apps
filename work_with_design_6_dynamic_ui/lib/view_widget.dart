

import 'package:flutter/material.dart';
import 'package:work_with_design_6_dynamic_ui/repository.dart';

class ViewWidget extends StatefulWidget {
  ViewWidget({super.key});

  // bool doWeNeedNewPicture = true;
  @override
  State<ViewWidget> createState() => _ViewWidgetState();
}

class _ViewWidgetState extends State<ViewWidget> {

  final Repositoty obj = Repositoty();


  @override
  Widget build(BuildContext context) {
    print('doWeNeedNewPicture ${obj.doWeNeedNewPicture}');
    return Center(
      child: Container(
        width: 300,
        height: 300,
        color: Colors.red,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.green,
              child: FutureBuilder(
                future: obj.getImageFromApi(),
                builder: (context, snapshot) {
                  print('obj.pictureUrl ${obj.pictureUrl}');
                  print('obj.doWeNeedNewPicture ${obj.doWeNeedNewPicture}');
                  print('context $context');
                  print('snapshot.data ${snapshot.data}');
                  if (snapshot.hasData ) {
                    obj.doWeNeedNewPicture = false;
                    // obj.doWeNeedNewPicture = false;
                    print('obj.doWeNeedNewPicture in if state ${obj.doWeNeedNewPicture}');
                    return Image.asset(
                      obj.pictureUrl,
                      fit: BoxFit.cover,
                    );
                    // return Image.network(
                    //   obj.pictureUrl,
                    //   fit: BoxFit.cover,
                    // );
                  } else {
                    // obj.getImageFromApi();
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
