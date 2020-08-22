import 'package:flutter/material.dart';
import 'package:news_flutter_app/screens/news_article_detail_screen.dart';
import 'package:news_flutter_app/viewmodels/news_article_view_model.dart';
import 'package:news_flutter_app/widgets/circle_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModle> articles;

  NewsGrid({this.articles});
  void _showNewsArticleDetails(context, article) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NewsArticleDetailScreen(
        article: article,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        var article = articles[index];
        return GestureDetector(
          onTap: () {
            _showNewsArticleDetails(context, article);
          },
          child: GridTile(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: CircleImage(
                urlToImage: article.urlToImage ?? 'غير معروف',
              ),
            ),
            footer: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Container(
                child: Text(
                  article.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        );
      },
      itemCount: this.articles.length,
    );
  }
}
