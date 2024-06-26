import 'dart:io';

import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:news_app/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/models/article_model.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase appDatabase;
  ArticleRepositoryImpl(this._newsApiService, this.appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticle(
          apiKey: NEWS_API_KEY, country: COUNTRY, cateogry: CATEGORY);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.response,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<void> deleteArticle(ArticleEntity articleEntity) {
    return appDatabase.articleDao
        .deleteArticle(articleEntity.fromEntityToModel());
  }

  @override
  Future<List<ArticleModel>> getSavedArticle() {
    return appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> insertArticle(ArticleEntity articleEntity) {
    return appDatabase.articleDao
        .insertArticle(articleEntity.fromEntityToModel());
  }
}
