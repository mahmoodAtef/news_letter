import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_letter/news_letter/domain_layer/entities/news.dart';

class NewsModel extends News {
  NewsModel({required super.id, required super.date, required super.description, required super.head, required super.images});
  static News fromJson (QueryDocumentSnapshot<Object?> json ,){
  return  News(
      id: json.id ,
      date: json['date'] as DateTime,
      description: json['description'] as String,
      head: json['head'] as String,
      images: json['images'] as List<String>,
    );
  }

  Map<String ,dynamic> toJson (){
    return {
      "id"  : id,
      "date"  : date,
      "head"  : head,
      "description"  : description,
      "images"  : images,
    };
  }
}