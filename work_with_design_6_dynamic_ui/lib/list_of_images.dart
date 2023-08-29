

import 'package:work_with_design_6_dynamic_ui/repository.dart';

class ListOfImages {
  ListOfImages._privateConstructor();

  static final ListOfImages instance = ListOfImages._privateConstructor();

  factory ListOfImages() {
    return instance;
  }

  List<String> list = [Repository().pictureUrl];
}