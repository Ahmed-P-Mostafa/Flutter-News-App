import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntity? article;
  const LocalArticleEvent({this.article});

  @override
  List<Object?> get props => [article!];
}

class GetSavedArticleEvent extends LocalArticleEvent {
  const GetSavedArticleEvent();
}

class AddArticleEvent extends LocalArticleEvent {
  const AddArticleEvent(ArticleEntity articleEntity)
      : super(article: articleEntity);
}

class DeleteArticleEvent extends LocalArticleEvent {
  const DeleteArticleEvent(ArticleEntity articleEntity)
      : super(article: articleEntity);
}
