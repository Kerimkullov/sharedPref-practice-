import 'package:first_app/constants/news_colors.dart';
import 'package:first_app/constants/news_textstyle.dart';
import 'package:flutter/material.dart';

class NewsListButtons extends StatelessWidget {
  const NewsListButtons({Key? key, required this.title, required this.clicked})
      : super(key: key);

  final String title;
  final bool clicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: SizedBox(
        height: 30,
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                clicked ? NewsColors.buttonBackground : Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          onPressed: () {},
          child: Text(title,
              style: clicked
                  ? NewsTextStyle.fontSize14NormalWhite
                  : NewsTextStyle.fontSize14Normal),
        ),
      ),
    );
  }
}
