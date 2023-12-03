import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_letter/module/data_layer/models/news_model.dart';

import '../../domain_layer/entities/news.dart';

abstract class BaseNewsRemoteDataSource {
  Stream<List<News>> getNewsStream();
}

class NewsRemoteDataSource extends BaseNewsRemoteDataSource {
  final CollectionReference newsCollection =
  FirebaseFirestore.instance.collection('news');

  @override
  Stream<List<News>> getNewsStream(){
    return newsCollection.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return NewsModel.fromJson(doc);
      }).toList();
    });
  }

}