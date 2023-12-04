import 'package:flutter/material.dart';
import 'package:news_letter/news_letter/domain_layer/entities/news.dart';
import 'package:news_letter/news_letter/presentation_layer/components/components.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    
      ),
      body: buildNewsWidget(news),
    );
  }
}

News news = News(id: "id", date: DateTime(2023 ,11 , 5),
    description: "The residential sector has witnessed significant growth, particularly in the segment of affordable housing, driven by government initiatives and the aspirations of a burgeoning middle class. Large-scale urban development projects, such as the New Administrative Capital, are transforming Egypt's real estate  initiatives and the aspirations of a burgeoning middle class. Large-scale  initiatives and the aspirations of a burgeoning middle class. Large-scale  landscape, creating... read more! particularly in the segment of affordable housing, driven by government initiatives and the aspirations of a burgeoning middle class. Large-scale urban development ",
    head: "Egypt's Real Estate: A Thriving Landscape", images: ["https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg" , "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg"]);