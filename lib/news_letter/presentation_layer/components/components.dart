import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_letter/core/utils/color_manager.dart';
import 'package:news_letter/core/utils/navigation_manager.dart';
import 'package:news_letter/news_letter/presentation_layer/screens/news_details.dart';

import 'package:sizer/sizer.dart';

import '../../domain_layer/entities/news.dart';
/// news Widget 
Widget buildNewsWidget(News news  , BuildContext context) {
  Duration timeAgo = DateTime.now().difference(news.date);
  String timeAgoString = calculateTimeAgo(timeAgo);

  Widget dateRow = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        timeAgoString,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorManager.primary),
      ),
      Text(
        DateFormat('dd-MM-yyyy').format(news.date),
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    ],
  );

  List<Widget> imageWidgets = news.images.take(3).map((image) =>
      Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,image: NetworkImage(image))
          ),
          )).toList();

  Widget imagesRow;

  if (imageWidgets.length == 1) {
    imagesRow = SizedBox(
      height: 20.h,
      width: double.infinity,
      child: imageWidgets[0],
    );
  } else if (imageWidgets.length == 2) {
    imagesRow = Row(
      children: imageWidgets
          .map((image) => Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 45.w),
          child: image,
        ),
      ))
          .toList(),
    );
  } else {
    imagesRow = Row(
      children: imageWidgets
          .map((image) => Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 30.w),
          child: image,
        ),
      ))
          .toList(),
    );
  }

  Widget spacedImagesRow = SizedBox(
    height: 20.h,
    width: double.infinity,
    child: imagesRow,
  );




  Widget mainColumn = SizedBox(
    height: 50.h,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        dateRow,
        spacedImagesRow,
        Expanded(
          flex: 1,
          child: Text(
            news.head,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin:  EdgeInsets.only(top: 8.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                maxLines: 4,
                    news.description,style: TextStyle
                  (
          
                    overflow: TextOverflow.ellipsis,
                    color: Colors.grey)
                ),
                if (news.description.length > 300 )
                  GestureDetector(
                    onTap: () {
                      context.push(NewsDetails(news: news));
                      print('تم النقر على زر عرض المزيد');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'read more',
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  return mainColumn;
}
/// News details page
Widget buildNewsDetails(News news) {
  Duration timeAgo = DateTime.now().difference(news.date);
  String timeAgoString = calculateTimeAgo(timeAgo);

  Widget dateRow = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        timeAgoString,
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorManager.primary),
      ),
      Text(
        DateFormat('dd-MM-yyyy').format(news.date),
        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    ],
  );

  List<Widget> imageWidgets = news.images.take(3).map((image) =>
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image))
        ),
      )).toList();

  Widget imagesRow;

  if (imageWidgets.length == 1) {
    imagesRow = SizedBox(
      height: 20.h,
      width: double.infinity,
      child: imageWidgets[0],
    );
  } else if (imageWidgets.length == 2) {
    imagesRow = Row(
      children: imageWidgets
          .map((image) => Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 45.w),
          child: image,
        ),
      ))
          .toList(),
    );
  } else {
    imagesRow = Row(
      children: imageWidgets
          .map((image) => Padding(
        padding: EdgeInsets.only(right: 7.0.sp),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 30.w),
          child: image,
        ),
      ))
          .toList(),
    );
  }

  Widget spacedImagesRow = SizedBox(
    height: 20.h,
    width: double.infinity,
    child: imagesRow,
  );




  Widget mainColumn = SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        dateRow,
        spacedImagesRow,
        Text(
          news.head,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Container(
          margin:  EdgeInsets.only(top: 8.sp),
          child: Text(
      news.description ,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey) ,

        ),
        )],
    ),
  );

  return mainColumn;
}
// دالة لحساب المدة من التاريخ المعطى إلى الوقت الحالي
String calculateTimeAgo(Duration timeDifference) {
  final int seconds = timeDifference.inSeconds;
  final int minutes = timeDifference.inMinutes;
  final int hours = timeDifference.inHours;
  final int days = timeDifference.inDays;
  final int months = (days / 30).floor();
  final int years = (days / 365).floor();

  if (seconds < 60) {
    return "a minute ago";
  } else if (minutes < 60) {
    return "$minutes minutes ago";
  } else if (hours < 24) {
    return "$hours hours ago";
  } else if (days == 1) {
    return "yesterday";
  } else if (days < 7) {
    return "$days days ago";
  } else if ( days > 7 && days <14 ) {
    return "last week";
  } else if (months == 1 || days > 14) {
    return "last month";
  } else if (months < 12) {
    return "$months months ago";
  } else if (years == 1) {
    return "last year";
  } else {
    return "$years years ago";
  }
}

