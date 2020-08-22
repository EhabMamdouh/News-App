import 'package:flutter/material.dart';
import 'package:news_flutter_app/models/news_article.dart';
import 'package:news_flutter_app/services/web_services.dart';
import 'package:news_flutter_app/viewmodels/news_article_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<NewsArticleViewModle> articles = List<NewsArticleViewModle>();

  get urlToImage => null;

  void topHeadlinesByCountry(String country) async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<NewsArticle> newsArticles = await WebService().fetchTopHeadLines();

    this.articles = newsArticles
        .map((article) => NewsArticleViewModle(article: article))
        .toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }

  void topHeadlines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadLines();
    notifyListeners();

    this.articles = newsArticles
        .map((article) => NewsArticleViewModle(article: article))
        .toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}
