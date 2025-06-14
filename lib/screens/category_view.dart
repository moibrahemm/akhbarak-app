import 'package:akhbarak_app/widgets/news_appbar.dart';
import 'package:akhbarak_app/widgets/news_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key, required this.category});
  final String category;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final RefreshController _refreshController = RefreshController();
  final GlobalKey<NewsListBuilderState> newsListKey =
      GlobalKey<NewsListBuilderState>();
  Future<void> _refreshNews() async {
    newsListKey.currentState?.reloadNews();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewsAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SmartRefresher(
          controller: _refreshController,
          onRefresh: _refreshNews,
          enablePullDown: true,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              NewsListBuilder(category: widget.category, key: newsListKey),
            ],
          ),
        ),
      ),
    );
  }
}
