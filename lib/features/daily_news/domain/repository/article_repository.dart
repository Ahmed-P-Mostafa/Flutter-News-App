import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/models/article_model.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticle();

  Future<List<ArticleModel>> getSavedArticle();
  Future<void> insertArticle(ArticleEntity articleEntity);
  Future<void> deleteArticle(ArticleEntity articleEntity);
}
