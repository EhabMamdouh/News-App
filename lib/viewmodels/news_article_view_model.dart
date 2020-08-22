import 'package:intl/intl.dart';
import 'package:news_flutter_app/models/news_article.dart';

class NewsArticleViewModle {
  NewsArticle _newsArticle;
  NewsArticleViewModle({NewsArticle article}) : _newsArticle = article;

  String get author {
    return _newsArticle.author;
  }

  String get title {
    return _newsArticle.title;
  }

  String get description {
    return _newsArticle.description;
  }

  String get url {
    return _newsArticle.url;
  }

  String get urlToImage {
    return _newsArticle.urlToImage;
  }

  String get publishedAt {
    final dateTime = DateFormat('yyyy-MM-ddTHH:mm:ssZ')
        .parse(_newsArticle.publishedAt.toString(), true);
    return DateFormat.yMMMMEEEEd('en-us').format(dateTime).toString();
  }

  String get content {
    return _newsArticle.content;
  }
}
