import 'package:get_it/get_it.dart';
import '../../news_letter/data_layer/data_sources/news_remote_data_sources.dart';
import '../../news_letter/data_layer/repositories/news_repository.dart';
import '../../news_letter/domain_layer/repsitories/base_news_repository.dart';
import '../../news_letter/presentation_layer/bloc/news_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init()  {

    /// main

    BaseNewsRemoteDataSource baseNewsRemoteDataSource = NewsRemoteDataSource();
    sl.registerLazySingleton(() => baseNewsRemoteDataSource);

    BaseNewsRepository baseNewsRepository = NewsRepository(sl());
    sl.registerLazySingleton(() => baseNewsRepository);

    /// blocs
    NewsBloc newsBloc = NewsBloc(NewsInitial());
    sl.registerLazySingleton(() => newsBloc);


    }
  }

