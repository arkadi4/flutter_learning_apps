import 'package:http/http.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
// import 'package:intl/intl.dart';

class User {
  int? id;
  String? name;
  String? surname;
  int? age;

  User({
    this.id,
    this.name,
    this.surname,
    this.age,
  });

  // factory User.getInfoFromJSON() {
  //   return User(
  //     name: name
  //   );
  // }

  // factory Student.fromJson(Map<String, dynamic> parsedJson){
  //   return Student(
  //       studentId: parsedJson['id'],
  //       studentName : parsedJson['name'],
  //       studentScores : parsedJson ['score']
  //   );
  // }

  Future<String> getInfoFromJSON() async {
    // Response response = await get(Uri.parse('./json_of_user.json'));
    Response response = await get(Uri.parse('https://jsonplaceholder.org/users'));
    // print(response.body);
    List jsonString = json.decode(response.body);
    // print(jsonString[0]);
    print(jsonString[0]['firstname']);
    // name = jsonString[0]['firstname'];
    return jsonString[0]['firstname'];
  }

  // String display() async {
  //   // String responseString = getInfoFromJSON().then((value) {
  //   //   print(value)
  //   // });
  //   await getInfoFromJSON();
  //   return 'User $name';
  // }

  // Future<String> _loadAStudentAsset() async {
  //   return await rootBundle.loadString('./json_of_user.json');
  // }
  // Future<Response>
  // Future loadStudent() async {
  //   String jsonString = await _loadAStudentAsset();
  //   final jsonResponse = json.decode(jsonString);
  //   print(jsonResponse);
  // }
}
