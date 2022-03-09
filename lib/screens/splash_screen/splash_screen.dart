import 'dart:async';

import 'package:first_app/constants/assets.dart';
import 'package:first_app/constants/news_colors.dart';
import 'package:first_app/constants/news_textstyle.dart';
import 'package:first_app/screens/news_list/news_list.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      (() => Navigator.pushNamed(context, '/news_list')),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewsColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.logo,
              width: 94,
              height: 94,
            ),
            const SizedBox(height: 43),
            const Text(
              'Новости',
              style: NewsTextStyle.fontSize24Normal,
            )
          ],
        ),
      ),
    );
  }
}
