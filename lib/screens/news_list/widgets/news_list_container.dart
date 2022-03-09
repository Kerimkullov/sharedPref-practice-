import 'package:first_app/screens/news_list/news_info_screen.dart';
import 'package:flutter/material.dart';

class NewsListContainer extends StatelessWidget {
  const NewsListContainer({Key? key, required this.image, required this.title})
      : super(key: key);

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Image.asset(image),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(title),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/news_list/info');
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16)
      ],
    );
  }
}
