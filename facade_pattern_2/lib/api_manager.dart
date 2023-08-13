import 'dart:convert';
import 'package:facade_pattern_2/user.dart';
import 'package:http/http.dart';


class ApiManager {
  List arrayForFiveUsersFromApi = [];
  Set shortListForFiveUsersFromApi = {};

  Future<Set> getInfoFromApi() async {
    Response response = await get(Uri.parse('https://jsonplaceholder.org/users'));
    // print('response.body ${response.body}'); jsonString[0]
    List jsonArray = json.decode(response.body);
    arrayForFiveUsersFromApi = jsonArray.sublist(0, 4);
    // print('jsonString[0] ${jsonString[0]}');
    // print('jsonString[0][\'id\'].runtimetype ${jsonString[0]['id'].runtimeType}');


    for (Map element in arrayForFiveUsersFromApi) {
      // print(element.runtimeType);
      User tempUser = User(
        id: element['id'],
        name : element['firstname'],
        lastname : element['lastname'],
        email : element['email'],
      );
      shortListForFiveUsersFromApi.add(tempUser);
    }
    return shortListForFiveUsersFromApi;
    // print('userList $userList');
    // print('userList[0].email ${shortListForFiveUsers[2].email}');
    // print('User().userList ${User().userList}');
    // print('first print after response await in getInfoFromJSON fn ${jsonString[0]['firstname']}');
    // name = jsonString[0]['firstname'];
    // return userList[0].email;
  }
}