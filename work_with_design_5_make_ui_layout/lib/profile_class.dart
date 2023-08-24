import 'dart:ui';

import 'package:flutter/material.dart';

class Profile {
  Color backgroundColor;
  String description;
  Color avatarColor;
  String name;
  int daysAgo;
  String notRecognizedByMeNumber;
  int leftBottomCornerNumber;
  int numberOfViews;
  int oneMoreNumber;
  int numberOfLikes;

  Profile({
    required this.backgroundColor,
    required this.description,
    required this.avatarColor,
    required this.name,
    required this.daysAgo,
    required this.notRecognizedByMeNumber,
    required this.leftBottomCornerNumber,
    required this.numberOfViews,
    required this.oneMoreNumber,
    required this.numberOfLikes
});
}