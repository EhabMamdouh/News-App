import 'package:dio/dio.dart';
import 'package:news_flutter_app/models/news_article.dart';

class WebService {
  var dio = Dio();
  Future<List<NewsArticle>> fetchTopHeadLines() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=eg&apiKey=ecdb6a84ae60435a82d86b7b60779644";
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("failled to get top news");
    }
  }
}
