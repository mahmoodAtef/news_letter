import 'package:flutter/material.dart';
import 'package:news_letter/news_letter/domain_layer/entities/news.dart';
import 'package:news_letter/news_letter/presentation_layer/components/components.dart';
import 'package:sizer/sizer.dart';

class NewsDetails extends StatelessWidget {
  final News news;
  const NewsDetails({super.key , required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Padding(
        padding:  EdgeInsets.all(8.0.sp),
        child: buildNewsDetails(news),
      ) ,
    );
  }
}
