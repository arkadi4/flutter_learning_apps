
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class Repository {

  Repository._privateConstructor();

  static final Repository instance = Repository._privateConstructor();

  factory Repository() {
    return instance;
  }

  List<String> listOfPictures = [];
  String pictureUrl = 'lib/assets/afonya.jpg';
  bool doWeNeedNewPicture = false;

  Future<String> getInitPicture() async {
    try {
      // await Future.delayed(Duration(seconds: 2), () {
      //   print('delay');
      //   pictureUrl = 'lib/assets/afonya.jpg';
      //   listOfPictures.add(pictureUrl);
      //   print('init list $listOfPictures');
      // });
      // return pictureUrl;

      Response response = await get(Uri.parse('https://api.unsplash.com/photos/'
          'random?client_id=r1GIuAdrO_caDs9uz0Hn9sSrZZZF7bsBr9okZ33ebZw'));
      // print('response \n ${response.body}');
      Map responseDecoded  = jsonDecode(response.body);
      print('responseDecoded in getInitPicture \n ${responseDecoded["urls"]['raw']}');
      pictureUrl = responseDecoded["urls"]['raw'];
      return pictureUrl;
    } catch (e) {
      debugPrint('$e');
      return 'error';
    }
  }

  Future<String> getImageFromApi() async {
    try {
      // if (doWeNeedNewPicture == false) return pictureUrl;

      // await Future.delayed(Duration(seconds: 2), () {
      //   print('delay');
      //   pictureUrl = 'lib/assets/afonya.jpg';
      // });
      // return pictureUrl;

      if (doWeNeedNewPicture == false) return pictureUrl;
      Response response = await get(Uri.parse('https://api.unsplash.com/photos/'
          'random?client_id=r1GIuAdrO_caDs9uz0Hn9sSrZZZF7bsBr9okZ33ebZw'));
      // print('response \n ${response.body}');
      Map responseDecoded  = jsonDecode(response.body);
      print('responseDecoded in getImageFromApi \n ${responseDecoded["urls"]['raw']}');
      pictureUrl = responseDecoded["urls"]['raw'];
      return pictureUrl;
    } catch(e) {
      print(e);
      return 'error';
    }
  }
}

