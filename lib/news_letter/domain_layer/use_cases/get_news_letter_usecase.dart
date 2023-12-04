
import '../entities/news.dart';
import '../repsitories/base_news_repository.dart';

class GetNewsLetterUseCase {
  final BaseNewsRepository baseAuthRepository;
  GetNewsLetterUseCase(this.baseAuthRepository);
  Stream<List<News>> call (){
    return baseAuthRepository.getNewsStream();
  }
}
