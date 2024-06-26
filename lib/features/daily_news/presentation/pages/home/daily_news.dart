import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_arrticle_state.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        "Daily News",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

_buildBody() {
  return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
    builder: (_, state) {
      if (state is RemoteArticleStateLoading) {
        return const Center(child: CupertinoActivityIndicator());
      }
      if (state is RemoteArticleStateError) {
        return const Center(
          child: Icon(Icons.refresh),
        );
      }
      if (state is RemoteArticleStateDone) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: ()=> onArticlePressed(context,state.articles![index]),
              child: ArticleWidget(
                article: state.articles![index]
              ),
            );
          },
          itemCount: state.articles!.length,
        );
      }

      return SizedBox();
    },
  );

  
}
void onArticlePressed(BuildContext context, ArticleEntity articleEntity) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: articleEntity);
  }