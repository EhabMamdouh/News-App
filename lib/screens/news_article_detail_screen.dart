import 'package:flutter/material.dart';
import 'package:news_flutter_app/viewmodels/news_article_view_model.dart';

class NewsArticleDetailScreen extends StatelessWidget {
  final NewsArticleViewModle article;

  NewsArticleDetailScreen({this.article});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                  maxWidth: 150,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "الناشر",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      article.author ?? 'غير معروف',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  article.title ?? 'غير معروف',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(article.publishedAt.toString()),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 300,
              child: Image.network(
                article.urlToImage,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                article.description ?? 'غير معروف',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
