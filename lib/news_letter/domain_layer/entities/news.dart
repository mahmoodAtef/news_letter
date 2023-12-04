import 'package:equatable/equatable.dart';


class News extends Equatable {
  String id;
      String head;
  String description;
      List<String> images;
  DateTime date;


News ({required this.id , required this.date , required this.description ,
  required this.head , required this.images  });

  @override
  List<Object?> get props => [id , head];

}


