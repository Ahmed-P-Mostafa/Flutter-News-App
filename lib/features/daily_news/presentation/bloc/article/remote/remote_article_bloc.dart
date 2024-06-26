import "package:flutter_bloc/flutter_bloc.dart";
import "package:news_app/core/resources/data_state.dart";
import "package:news_app/features/daily_news/domain/usecases/get_articles.dart";
import "package:news_app/features/daily_news/presentation/bloc/article/remote/remote_arrticle_state.dart";
import "package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart";

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticlesUseCase getArticlesUseCase;

  RemoteArticleBloc(this.getArticlesUseCase)
      : super(const RemoteArticleStateLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await getArticlesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleStateDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(RemoteArticleStateError(dataState.error!));
    }
  }
}
