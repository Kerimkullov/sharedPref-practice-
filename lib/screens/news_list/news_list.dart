import 'package:first_app/constants/assets.dart';
import 'package:first_app/constants/news_colors.dart';
import 'package:first_app/constants/news_textstyle.dart';
import 'package:flutter/material.dart';

import 'widgets/news_list_buttons.dart';
import 'widgets/news_list_container.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  List<String> buttonTitles = ['Все', 'Интернет', 'Звонки'];

  List<bool> selectButton = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NewsColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: NewsColors.background,
        title: const Text('Новости', style: NewsTextStyle.fontSize20W700),
        centerTitle: false,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.language,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                NewsListButtons(
                  title: buttonTitles[0],
                  clicked: selectButton[0],
                ),
                NewsListButtons(
                    title: buttonTitles[1], clicked: selectButton[1]),
                NewsListButtons(
                    title: buttonTitles[2], clicked: selectButton[2]),
              ],
            ),
            const SizedBox(height: 20),
            const NewsListContainer(
                title: 'Незаконное строительство', image: Assets.newsImage),
            const NewsListContainer(
                title: 'Незаконное строительство', image: Assets.newsImage),
          ],
        ),
      ),
    );
  }
}
