import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain_layer/entities/news.dart';

abstract class BaseNewsRemoteDataSource {


  Stream<List<News>> getNewsStream() ;

}

class NewsRemoteDataSource extends BaseNewsRemoteDataSource {
  final CollectionReference newsCollection =
  FirebaseFirestore.instance.collection('news');

  @override
  Stream<List<News>> getNewsStream(){
    return newsCollection.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return News(
          id: doc.id,
          date: doc['date'] as DateTime,
          description: doc['description'] as String,
          head: doc['head'] as String,
          images: doc['images'] as List<String>,
        );
      }).toList();
    });
  }

}