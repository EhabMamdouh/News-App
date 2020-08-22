import 'package:flutter/material.dart';
import 'package:news_flutter_app/viewmodels/news_article_list_view_model.dart';
import 'package:news_flutter_app/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "موجز الأخبار",
              style: TextStyle(fontSize: 40, color: Colors.black),
            ),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Divider(
                  color: Colors.blueAccent,
                  height: 40,
                  thickness: 8,
                  indent: 30,
                  endIndent: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      "عناوين الأخبار",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: NewsGrid(
                    articles: listViewModel.articles,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
