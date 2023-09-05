
import 'dart:math';
import 'package:faker/faker.dart';
import 'package:work_with_lists_1_common_task/user.dart';

abstract class RandomUserGenerator {
  static List<User> usersList = [];

  static init() {
    for (var i=0;i<30;i++) {
      User user = User(
        firstName: Faker().person.firstName(),
        lastName: Faker().person.lastName(),
        age: Faker().randomGenerator.integer(70, min: 10),
        sex: (Random().nextBool()) ? 'male' : 'female',
        description: Faker().lorem.sentence(),
      );
      usersList.add(user);
    }
  }
}

// import 'package:dart_randomx/dart_randomx.dart';
// abstract class RandomUserGenerator {
//   static Future<void>  init() async {
//     await RandomX.loadLib();
//
//     var randomX = RandomX();
//
//     print(randomX);
//
//     var key = Uint8List.fromList([97, 98, 99, 100, 101, 102, 0]);
//     randomX.init(key);
//
//     var data = Uint8List.fromList([65, 66, 67, 68, 69, 0]);
//
//     var hash = randomX.hash(data);
//     print(hash);
//
//     randomX.destroy();
//   }
// }



