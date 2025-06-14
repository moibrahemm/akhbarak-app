import 'package:akhbarak_app/models/article_model.dart';
import 'package:akhbarak_app/widgets/news_tile.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  final List<ArticleModel> articles;
  const NewsList({super.key, required this.articles});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: NewsTile(articleModel: articles[index]),
        ),
      ),
    );
  }
}
