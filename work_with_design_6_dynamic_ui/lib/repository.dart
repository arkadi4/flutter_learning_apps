
import 'dart:convert';
import 'package:http/http.dart';

class Repositoty {

  Repositoty._privateConstructor();

  static final Repositoty instance = Repositoty._privateConstructor();

  factory Repositoty() {
    return instance;
  }

  List<String> listOfPictures = ['lib/assets/afonya.jpg'];

  String pictureUrl = 'lib/assets/afonya.jpg';
  bool doWeNeedNewPicture = false;

  Future<String> getImageFromApi() async {
    try {
      if (doWeNeedNewPicture == false) return pictureUrl;

      await Future.delayed(Duration(seconds: 2), () {
        print('delay');
        pictureUrl = 'lib/assets/afonya.jpg';
        if (listOfPictures.length > 1) {
          listOfPictures.add(pictureUrl);
        }


      });
      return pictureUrl;

      // Response response = await get(Uri.parse('https://api.unsplash.com/photos/'
      //     'random?client_id=r1GIuAdrO_caDs9uz0Hn9sSrZZZF7bsBr9okZ33ebZw'));
      // print('response \n ${response.body}');
      // Map responseDecoded  = jsonDecode(response.body);
      // print('responseDecoded \n ${responseDecoded["urls"]['raw']}');
      // pictureUrl = responseDecoded["urls"]['raw'];
      // return pictureUrl;
    } catch(e) {
      print(e);
      return 'error';
    }
  }
}

