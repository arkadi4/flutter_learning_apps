import 'package:http/http.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class User {
  int? id;
  String? name;
  String? lastname;
  String? email;
  List<User> userList = [];

  User({
    this.id,
    this.name,
    this.lastname,
    this.email,
  });

  // Future<void> getInfoFromJSON() async {
  //   Response response = await get(Uri.parse('https://jsonplaceholder.org/users'));
  //   // print('response.body ${response.body}'); jsonString[0]
  //   List jsonString = json.decode(response.body);
  //   // print('jsonString[0] ${jsonString[0]}');
  //   // print('jsonString[0][\'id\'].runtimetype ${jsonString[0]['id'].runtimeType}');
  //   for (Map element in jsonString) {
  //     // print(element.runtimeType);
  //     User tempUser = User(
  //       id: element['id'],
  //       name : element['firstname'],
  //       lastname : element['lastname'],
  //       email : element['email'],
  //     );
  //     userList.add(tempUser);
  //   }
  //   // print('userList $userList');
  //   print('userList[0].email ${userList[0].email}');
  //   // print('User().userList ${User().userList}');
  //   // print('first print after response await in getInfoFromJSON fn ${jsonString[0]['firstname']}');
  //   // name = jsonString[0]['firstname'];
  //   // return userList[0].email;
  // }

  // Future<String>  display() async {
  //   // String responseString = getInfoFromJSON().then((value) {
  //   //   print(value)
  //   // });
  //   await getInfoFromJSON().then((value) => print('in display fn first print $value'));
  //   print ('Second print in display fn ---- name = $name');
  //   return 'User $name';
  // }


}
