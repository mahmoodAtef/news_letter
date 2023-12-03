import 'package:news_letter/module/domain_layer/entities/news.dart';

class NewsModel extends News {
  NewsModel({required super.id, required super.date, required super.description, required super.head, required super.images});
  static News fromJson (Map<String ,dynamic> json){
    return News(id: json["id"],
        date: json["date"],
        description: json["description"], head: json["head"],
        images: json["images"]as List<String>);
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