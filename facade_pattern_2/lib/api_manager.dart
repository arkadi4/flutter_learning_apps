import 'dart:convert';
import 'package:facade_pattern_2/user.dart';
import 'package:http/http.dart';


class ApiManager {


  /////////////// call api each time new user appears

  Future<dynamic> getOneUserFromApiByName(name) async {
    try {
      Response response = await get(Uri.parse('https://jsonplaceholder.org/users'));
      for (var element in json.decode(response.body)) {
        if (element['firstname'] == name) {
          return element;
        }
      }
    } catch (e) {
      print(e);
    }

  }

//////////////// call api one time

  late List apiList;
  List userList = [];

  Future<void> getApiAndStoreIt() async {
    Response response = await get(Uri.parse('https://jsonplaceholder.org/users'));
    apiList = json.decode(response.body).sublist(0, 5);
  }

  void makeUserList(){
    for (Map element in apiList) {
      User tempUser = User(
        id: element['id'],
        name: element['firstname'],
        lastname: element['lastname'],
        email: element['email'],
      );
      userList.add(tempUser);
    }
  }



  // Future<Set> getInfoFromApi() async {
  //   Response response = await get(Uri.parse('https://jsonplaceholder.org/users'));
  //   // print('response.body ${response.body}'); jsonString[0]
  //   List jsonArray = json.decode(response.body);
  //   arrayForFiveUsersFromApi = jsonArray.sublist(0, 4);
  //   // print('jsonString[0] ${jsonString[0]}');
  //   // print('jsonString[0][\'id\'].runtimetype ${jsonString[0]['id'].runtimeType}');
  //
  //   for (Map element in arrayForFiveUsersFromApi) {
  //     // print(element.runtimeType);
  //     User tempUser = User(
  //       id: element['id'],
  //       name : element['firstname'],
  //       lastname : element['lastname'],
  //       email : element['email'],
  //     );
  //     shortListForFiveUsersFromApi.add(tempUser);
  //   }
  //   return shortListForFiveUsersFromApi;
  // }
}