

import 'package:flutter/material.dart';
import 'package:work_with_design_6_dynamic_ui/get_random_image.dart';

class ViewWidget extends StatefulWidget {
  ViewWidget({super.key});

  @override
  State<ViewWidget> createState() => _ViewWidgetState();
}

class _ViewWidgetState extends State<ViewWidget> {
  GetRandomImage obj = GetRandomImage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  print('context $context');
                  print('snapshot.data ${snapshot.data}');
                  if (snapshot.hasData) {
                    return Image.network(
                      obj.pictureUrl,
                      fit: BoxFit.cover,
                    );
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
