import 'package:akhbarak_app/widgets/categories_list.dart';
import 'package:akhbarak_app/widgets/news_appbar.dart';
import 'package:akhbarak_app/widgets/news_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RefreshController _refreshController = RefreshController();
  final GlobalKey<NewsListBuilderState> newsListKey =
      GlobalKey<NewsListBuilderState>();
  Future<void> _onRefresh() async {
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
          onRefresh: _onRefresh,
          enablePullDown: true,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: const CategoriesList()),
              SliverToBoxAdapter(child: const SizedBox(height: 10.0)),
              NewsListBuilder(key: newsListKey),
            ],
          ),
        ),
      ),
    );
  }
}
