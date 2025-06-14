import 'package:akhbarak_app/extensions/size_extension.dart';
import 'package:akhbarak_app/models/article_model.dart';
import 'package:akhbarak_app/services/news_service.dart';
import 'package:akhbarak_app/widgets/news_list.dart';
import 'package:flutter/material.dart';

class NewsListBuilder extends StatefulWidget {
  const NewsListBuilder({super.key, this.category = 'general'});
  final String category;

  @override
  State<NewsListBuilder> createState() => NewsListBuilderState();
}

class NewsListBuilderState extends State<NewsListBuilder> {
  late Future<List<ArticleModel>> future;
  @override
  void initState() {
    super.initState();
    reloadNews();
  }

  void reloadNews() {
    future = NewsService().getNews(category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return SliverFillRemaining(
              child: Center(
                child: Text(
                  'لا توجد أخبار حالياً',
                  style: TextStyle(
                    fontSize: context.height * 0.022,
                    color: Colors.grey,
                  ),
                ),
              ),
            );
          }
          return NewsList(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                'There was an error, try again later',
                style: TextStyle(fontSize: context.height * 0.022),
              ),
            ),
          );
        } else {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(color: Colors.black),
            ),
          );
        }
      },
    );
  }
}
