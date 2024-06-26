import "package:get_it/get_it.dart";
import "package:dio/dio.dart";
import "package:news_app/features/daily_news/data/data_sources/local/app_database.dart";
import "package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart";
import "package:news_app/features/daily_news/data/repository/article_repository_impl.dart";
import "package:news_app/features/daily_news/domain/repository/article_repository.dart";
import "package:news_app/features/daily_news/domain/usecases/add_article.dart";
import "package:news_app/features/daily_news/domain/usecases/delete_article.dart";
import "package:news_app/features/daily_news/domain/usecases/get_articles.dart";
import "package:news_app/features/daily_news/domain/usecases/get_saved_article.dart";
import "package:news_app/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart";
import "package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart";

final serviceLocator = GetIt.instance;
Future<void> initializeDependencies() async {
  serviceLocator.registerSingleton<Dio>(Dio());
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  serviceLocator
      .registerSingleton<NewsApiService>(NewsApiService(serviceLocator()));

  serviceLocator.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(serviceLocator(), serviceLocator()));

  serviceLocator.registerSingleton<GetArticlesUseCase>(
      GetArticlesUseCase(serviceLocator()));

  serviceLocator.registerSingleton<AddArticleUseCase>(
      AddArticleUseCase(serviceLocator()));

  serviceLocator.registerSingleton<DeleteArticleUseCase>(
      DeleteArticleUseCase(serviceLocator()));

  serviceLocator.registerSingleton<GetSavedArticlesUseCase>(
      GetSavedArticlesUseCase(serviceLocator()));

  serviceLocator.registerFactory(() => RemoteArticleBloc(serviceLocator()));
  serviceLocator.registerFactory(() =>
      LocalArticleBloc(serviceLocator(), serviceLocator(), serviceLocator()));

  serviceLocator.registerSingleton<AppDatabase>(database);
}
