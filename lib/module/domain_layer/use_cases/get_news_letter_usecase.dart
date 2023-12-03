import 'package:news_letter/module/domain_layer/repsitories/base_news_repository.dart';

import '../entities/news.dart';

class GetNewsLetterUseCase {
  final BaseNewsRepository baseAuthRepository;
  GetNewsLetterUseCase(this.baseAuthRepository);
  Stream<List<News>> call (){
    return baseAuthRepository.getNewsStream();
  }
}
