import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:dio/dio.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioError? error;
  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

class RemoteArticleStateLoading extends RemoteArticleState {
  const RemoteArticleStateLoading();
}

class RemoteArticleStateDone extends RemoteArticleState {
  const RemoteArticleStateDone(List<ArticleEntity> articles)
      : super(articles: articles);
}

class RemoteArticleStateError extends RemoteArticleState {
  const RemoteArticleStateError(DioError error) : super(error: error);
}
