import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_letter/news_letter/domain_layer/use_cases/get_news_letter_usecase.dart';

import '../../../core/services/dep_injection.dart';
import '../../domain_layer/entities/news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  Stream<List<News>> ? newsLetter ;
  NewsBloc(NewsInitial newsInitial) : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
     if (event is GetNewsEvent){
     newsLetter =  GetNewsLetterUseCase(sl()).call();
     }
    });
  }
}
