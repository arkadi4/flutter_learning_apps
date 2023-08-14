import 'package:facade_pattern_2/user_manager.dart';
import 'package:flutter/material.dart';

class ViewWidget extends StatefulWidget {
  const ViewWidget({super.key});

  @override
  State<ViewWidget> createState() => _ViewWidgetState();
}

class _ViewWidgetState extends State<ViewWidget> {

  String? name;
  UserManager userManager = UserManager();
  // var user;
  Map user = {
    'id': 'yet unknown',
    'firstname': 'yet unknown',
    'lastname': 'yet unknown',
    'email': 'yet unknown',
  };

  void getData() async {
    user = await userManager.getUserInfo();
    setState(() {
      user;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Column(
            children: [
              const Text('There are five users in this example.\n'
                  ' You can get '
                  'information on random user by pressing the button below.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: getData,
                child: Text(
                  'Get information on random user \n '
                      'from ${userManager.typeOfRequest}',
                  textAlign: TextAlign.center,// ${getInfoElement()}
                ),
              ),
              const SizedBox(height: 30,),
              const Text('User info'),
              Row(
                children: [
                  const Text('User id:'),
                  Text('${user['id']}'),
                ],
              ),
              Row(
                children: [
                  const Text('User name:'),
                  Text('${user['firstname']}'),
                  // Text('${  User().display().then((value) => value)}'),

                ],
              ),
              Row(
                children: [
                  const Text('User surname:'),
                  Text('${user['lastname']}'),
                ],
              ),
              Row(
                children: [
                  const Text('User email:'),
                  Text('${user['email']}'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
