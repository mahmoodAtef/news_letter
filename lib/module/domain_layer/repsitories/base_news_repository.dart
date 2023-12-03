import '../../domain_layer/entities/news.dart';

abstract class BaseNewsRepository {
  Stream<List<News>> getNewsStream();

}