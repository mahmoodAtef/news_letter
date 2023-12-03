import 'package:news_letter/module/domain_layer/entities/news.dart';
import 'package:news_letter/module/domain_layer/repsitories/base_news_repository.dart';

import '../data_sources/news_remote_data_sources.dart';

class NewsRepository extends BaseNewsRepository{

  BaseNewsRemoteDataSource dataSource ;
  NewsRepository(this.dataSource);
  @override
  Stream<List<News>> getNewsStream() {
    return dataSource.getNewsStream();
  }

}