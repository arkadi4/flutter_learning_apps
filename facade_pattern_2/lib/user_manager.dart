import 'dart:math';
import 'package:facade_pattern_2/api_manager.dart';
import 'package:facade_pattern_2/cache_manager.dart';
import 'package:flutter/foundation.dart';

// enum TypeOfRequest {cache , api}

class UserManager {
  String typeOfRequest = 'api';
  CacheManager cacheManager = CacheManager();
  ApiManager apiManager = ApiManager();
  List<String> userNames = ['John', 'Jane', 'Bob', 'Emily', 'William',];
  late String userForSearch;
  late Map tempUser;

  Future getUserInfo() async {
    userForSearch = userNames[Random().nextInt(userNames.length)];
    var listOfNamesInCache = cacheManager.usersListInCache.map((e) => e['firstname']);
    if (listOfNamesInCache.contains(userForSearch)) {
      typeOfRequest = 'cache';
      for (var element in cacheManager.usersListInCache) {
        if (element['firstname'] == userForSearch) {
          return element;
        }
      }
    } else {
      typeOfRequest = 'api';
      try {
        tempUser = await apiManager.getOneUserFromApiByName(userForSearch);
        cacheManager.usersListInCache.add(tempUser);
        return tempUser;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }





  // late User userForReturn;
  // Future<User?> getInfoOnUser() async {
  //   userForSearch = userNames[Random().nextInt(userNames.length)];
  //   List listOfNamesInCache = cacheManager.usersListInCache.map((e) => e.name).toList();
  //   try {
  //     if (listOfNamesInCache.contains(userForSearch)) {
  //       for (User user in cacheManager.usersListInCache) {
  //         if (user.name == userForSearch) {
  //           userForReturn = user;
  //         }
  //       }
  //       return userForReturn;
  //     } else {
  //       await apiManager.getApiAndStoreIt();
  //       apiManager.makeUserList();
  //       print('went api');
  //       for (User user in apiManager.userList) {
  //         if (user.name == userForSearch) {
  //           userForReturn = user;
  //         }
  //       }
  //       cacheManager.usersListInCache.add(userForReturn);
  //       print('cacheManager.shortListForFiveUsersFromCache ${cacheManager.usersListInCache}');
  //       print('userForReturn from api $userForReturn');
  //       return userForReturn;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}