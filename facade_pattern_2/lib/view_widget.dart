import 'package:flutter/material.dart';

class ViewWidget extends StatelessWidget {
  const ViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Get information on user',
        ),
      ),
    );
  }
}
