

class User {
  final String firstName;
  final String lastName;
  final int age;
  final String sex;
  final String squareAvatarUrl;
  String description;

  User({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.sex,
    this.squareAvatarUrl = 'https://image.cnbcfm.com/api/v1/image/105773423'
        '-1551716977818rtx6p9yw.jpg?v=1551717428&w=700&h=700',
    required this.description
  });
}