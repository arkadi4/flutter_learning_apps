
import 'dart:convert';
import 'package:http/http.dart';

class GetRandomImage {

  String pictureUrl = 'default url';

  Future<String> getImageFromApi() async {
    try {
      Response response = await get(Uri.parse('https://api.unsplash.com/photos/'
          'random?client_id=r1GIuAdrO_caDs9uz0Hn9sSrZZZF7bsBr9okZ33ebZw'));
      // print('response \n ${response.body}');
      Map responseDecoded  = jsonDecode(response.body);
      print('responseDecoded \n ${responseDecoded["urls"]['raw']}');
      pictureUrl = responseDecoded["urls"]['raw'];
      return pictureUrl;
    } catch(e) {
      print(e);
      return 'error';
    }
  }
}

