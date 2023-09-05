

import 'package:flutter/material.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          if (index % 4 == 0) {
            return Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                children: [
                  Expanded(child: Text('index $index')),
                  Column(
                    children: [
                      Container(
                        height: 49,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                        ),
                        child: Text('index $index')
                      ),
                      Container(
                        height: 49,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                        ),
                        child: Text('index $index'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          if (index % 4 == 2) {
            return Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                children: [

                  Column(
                    children: [
                      Container(
                          height: 49,
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)
                          ),
                          child: Text('index $index')
                      ),
                      Container(
                        height: 49,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)
                        ),
                        child: Text('index $index'),
                      ),
                    ],
                  ),
                  Expanded(child: Text('index $index')),
                ],
              ),
            );
          }
          return Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Text('index $index'),
          );
        },
      ),
    );
  }
}
