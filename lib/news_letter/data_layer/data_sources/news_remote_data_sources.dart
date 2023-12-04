import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain_layer/entities/news.dart';
import '../models/news_model.dart';

abstract class BaseNewsRemoteDataSource {
  Stream<List<News>> getNewsStream();
}

class NewsRemoteDataSource extends BaseNewsRemoteDataSource {
  final CollectionReference newsCollection =
  FirebaseFirestore.instance.collection('news_letter');
  @override
  Stream<List<News>> getNewsStream(){
    return newsCollection.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return NewsModel.fromJson(doc);
      }).toList();
    });
  }

}