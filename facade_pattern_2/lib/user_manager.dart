

import 'dart:math';

import 'package:facade_pattern_2/api_manager.dart';
import 'package:facade_pattern_2/cache_manager.dart';
import 'package:facade_pattern_2/user.dart';

class UserManager {
  CacheManager cacheManager = CacheManager();

  ApiManager apiManager = ApiManager();
  late User userForReturn;
  late String userForSearch;
  List<String> userNames = ['John', 'Jane', 'Bob', 'Emily',];

  Future<User?> getInfoOnUser() async {
    userForSearch = userNames[Random().nextInt(userNames.length)];
    print('userForSearch $userForSearch');
    List listOfNamesInCache = cacheManager.shortListForFiveUsersFromCache.map((e) => e.name).toList();
    print('listOfNamesInCache $listOfNamesInCache');
    try {
      if (listOfNamesInCache.contains(userForSearch)) {
        print('went cache');
        print('cacheManager.shortListForFiveUsersFromCache ${cacheManager.shortListForFiveUsersFromCache}');
        // int randomIndex = Random().nextInt(cacheManager.shortListForFiveUsersFromCache!.length);
        // User userForReturn = cacheManager.shortListForFiveUsersFromCache?[randomIndex];

        for (User user in cacheManager.shortListForFiveUsersFromCache) {
          if (user.name == userForSearch) {
            userForReturn = user;
          }
        }
        print('userForReturn from cache $userForReturn');
        return userForReturn;

      } else {
        print('went api');
        Set userListFromApi = await apiManager.getInfoFromApi();
        print('userListFromApi $userListFromApi');
        Set listOfNamesInApi = userListFromApi.map((e) => e.name).toSet();
        print('listOfNamesInApi $listOfNamesInApi');
        // int randomIndex = Random().nextInt(userListFromApi.length);
        for (User user in userListFromApi) {
          if (user.name == userForSearch) {
            userForReturn = user;
          }
        }

        // userForReturn = userListFromApi[randomIndex];

        cacheManager.shortListForFiveUsersFromCache.add(userForReturn);
        print('cacheManager.shortListForFiveUsersFromCache ${cacheManager.shortListForFiveUsersFromCache}');
        // cacheManager.shortListForFiveUsersFromCache.add(userForReturn);
        print('userForReturn from api $userForReturn');
        return userForReturn;

      }
    } catch (e) {
      print(e);
    }
  }

}