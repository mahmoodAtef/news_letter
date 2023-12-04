import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_letter/news_letter/domain_layer/entities/news.dart';
import 'package:news_letter/news_letter/presentation_layer/bloc/news_bloc.dart';
import 'package:news_letter/news_letter/presentation_layer/components/components.dart';
import 'package:sizer/sizer.dart';

import '../../../core/services/dep_injection.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewsBloc bloc = sl()..add(GetNewsEvent());
    return BlocProvider<NewsBloc>(
  create: (context) => sl(),
  child: BlocBuilder<NewsBloc, NewsState>(
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
    title: const Text("News Letter" , style: TextStyle(
      fontWeight: FontWeight.bold
    ),),
      ),
      body: State is GetNewsLoading ?
        Center(
      child: CircularProgressIndicator(),
  ) :
    SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.all(8.0.sp),
        child: Column(
          children: [

            StreamBuilder(stream: bloc.newsLetter, builder: (context , builder){
              return ListView.separated(itemBuilder: (context , index)=> buildNewsWidget
                (builder.data![index]), separatorBuilder: (context , index)=> SizedBox(
                height: 5.sp,
              ), itemCount: builder.data!.length = 0);
            },),
          ],
        ),
      ),
    ),
    );
  },
),
);
  }
}

News newsTest = News(id: "id", date: DateTime(2023 ,11 , 5),
    description: "The residential sector has witnessed significant growth, particularly in the segment of affordable housing, driven by government initiatives and the aspirations of a burgeoning middle class. Large-scale urban development projects, such as the New Administrative Capital, are transforming Egypt's real estate  initiatives and the aspirations of a burgeoning middle class. Large-scale  initiatives and the aspirations of a burgeoning middle class. Large-scale  landscape, creating... read more! particularly in the segment of affordable housing, driven by government initiatives and the aspirations of a burgeoning middle class. Large-scale urban development ",
    head: "Egypt's Real Estate: A Thriving Landscape", images: ["https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg" , "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg"]);