import 'package:flutter/material.dart';

class NewsTextStyle {
  static const TextStyle fontSize24Normal =
      TextStyle(fontSize: 24, fontWeight: FontWeight.normal);

  static const TextStyle fontSize20W700 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black);

  static TextStyle fontSize14Normal = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black.withOpacity(0.5));

  static TextStyle fontSize14NormalWhite = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white);
}
