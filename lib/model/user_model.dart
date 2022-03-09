import 'package:first_app/constants/assets.dart';

class User {
  int id;
  String name;
  String image;

  User({
    required this.id,
    required this.image,
    required this.name,
  });

  static List<User> getListUser() {
    return [
      User(id: 1, image: Assets.logo, name: 'Жыпаркулов Мырзабек Жыпаркулович'),
      User(id: 2, image: Assets.newsImage, name: 'Артыкбаев Расул Саткынович'),
      User(id: 3, image: Assets.logo, name: 'Жыпаркулов Мырзабек Жыпаркулович'),
      User(id: 4, image: Assets.newsImage, name: 'Артыкбаев Расул Саткынович'),
      User(id: 5, image: Assets.logo, name: 'Жыпаркулов Мырзабек Жыпаркулович'),
      User(id: 6, image: Assets.newsImage, name: 'Артыкбаев Расул Саткынович'),
      User(id: 7, image: Assets.logo, name: 'Жыпаркулов Мырзабек Жыпаркулович'),
      User(
          id: 8,
          image: Assets.newsImage,
          name: 'Эсенгельдиев Эржан Уланбекович'),
    ];
  }

  static User getUserById(int id) {
    return getListUser().where((element) => element.id == id).first;
  }
}
