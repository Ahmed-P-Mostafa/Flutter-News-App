
import 'package:news_app/core/usecases/use_case.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class DeleteArticleUseCase
    implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;
  DeleteArticleUseCase(this._articleRepository);
  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.deleteArticle(params!);
  }
}