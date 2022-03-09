import 'package:first_app/constants/assets.dart';
import 'package:first_app/constants/news_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsInfoScreen extends StatelessWidget {
  const NewsInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();

    final format = DateFormat('dd.MM.yy');

    final actualDate = format.format(date);

    return Scaffold(
      backgroundColor: NewsColors.background,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () =>
                Navigator.popUntil(context, ModalRoute.withName('/')),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: NewsColors.background,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
                'Управление по контролю, надзору за водными ресурсами и объектами (далее УКНВРиО) 29 июля 2020 года провело рабочее видео-совещание.'),
            const SizedBox(height: 16),
            Text('Дата $actualDate'),
            const SizedBox(height: 16),
            Image.asset(Assets.newsImage),
            const SizedBox(height: 8),
            Image.asset(Assets.newsImage)
          ],
        ),
      ),
    );
  }
}
