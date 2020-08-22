import 'package:flutter/material.dart';
import 'package:news_flutter_app/screens/news_screen.dart';
import 'package:news_flutter_app/viewmodels/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تطبيق الأخبار',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfffefdfd),
        appBarTheme: AppBarTheme(
            textTheme: TextTheme(),
            color: Color(0xfffefdfd),
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            actionsIconTheme: IconThemeData(
              color: Colors.black,
            )),
        fontFamily: 'Cairo',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => NewsArticleListViewModel(),
        )
      ], child: NewsScreen()),
    );
  }
}
