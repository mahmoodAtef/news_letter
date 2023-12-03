import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_letter_state.dart';

class NewsLetterCubit extends Cubit<NewsLetterState> {
  NewsLetterCubit() : super(NewsLetterInitial());
}
