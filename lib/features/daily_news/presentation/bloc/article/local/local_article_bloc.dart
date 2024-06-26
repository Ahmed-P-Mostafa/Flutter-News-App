import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/usecases/add_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/delete_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticlesUseCase getSavedArticleUseCase;
  final AddArticleUseCase addArticleUseCase;
  final DeleteArticleUseCase deleteArticleUseCase;

  LocalArticleBloc(
      this.addArticleUseCase, this.deleteArticleUseCase, this.getSavedArticleUseCase)
      : super(const LocalArticleLoading()) {
    on<GetSavedArticleEvent>(onGetSavedArticles);
    on<AddArticleEvent>(onAddArticle);
    on<DeleteArticleEvent>(onDeleteArticle);
  }

  void onGetSavedArticles(
      GetSavedArticleEvent event, Emitter<LocalArticleState> emit) async {
    final articles = await getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void onDeleteArticle(
      DeleteArticleEvent deleteArticle, Emitter<LocalArticleState> emit) async {
    await deleteArticleUseCase(params: deleteArticle.article);
    final articles = await getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void onAddArticle(
      AddArticleEvent addArticle, Emitter<LocalArticleState> emit) async {
    await addArticleUseCase(params: addArticle.article);
    final articles = await getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }
}
