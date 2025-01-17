import 'package:floor/floor.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

@Entity(tableName: 'article',primaryKeys: ['id'])
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    int ? id,
    String ? author,
    String ? title,
    String ? description,
    String ? url,
    String ? urlToImage,
    String ? publishedAt,
    String ? content,
  }) :super(
    author: author,
    id: id,
    content: content,
    description: description,
    publishedAt: publishedAt,
    title: title,
    url: url,
    urlToImage: urlToImage
  );

  factory ArticleModel.fromJson(Map < String, dynamic > map) {
    return ArticleModel(
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage']??"" ,//!= null && map['urlToImage'] != "" ? map['urlToImage'] : kDefaultImage,
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }

  // factory ArticleModel.fromEntity(ArticleEntity entity) {
  //   return ArticleModel(
  //     id: entity.id,
  //     author: entity.author,
  //     title: entity.title,
  //     description: entity.description,
  //     url: entity.url,
  //     urlToImage: entity.urlToImage,
  //     publishedAt: entity.publishedAt,
  //     content: entity.content
  //   );
  // }
}