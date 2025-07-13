import 'package:akhbarak_app/cubits/news_cubit/news_cubit.dart';
import 'package:akhbarak_app/cubits/news_cubit/news_state.dart';
import 'package:akhbarak_app/widgets/categories_list.dart';
import 'package:akhbarak_app/widgets/news_appbar.dart';
import 'package:akhbarak_app/widgets/news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewsCubit>().fetchNews();
    });
  }

  Future<void> _handleRefresh() async {
    await context.read<NewsCubit>().fetchNews();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewsAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading || state is NewsInitial) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.black),
              );
            } else if (state is NewsLoaded) {
              return SmartRefresher(
                controller: _refreshController,
                enablePullDown: true,
                onRefresh: _handleRefresh,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    const SliverToBoxAdapter(child: CategoriesList()),
                    const SliverToBoxAdapter(child: SizedBox(height: 10)),
                    if (state.newsList.isEmpty)
                      const SliverFillRemaining(
                        child: Center(
                          child: Text(
                            'لا توجد أخبار حالياً',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      )
                    else
                      NewsList(articles: state.newsList),
                  ],
                ),
              );
            } else if (state is NewsFailure) {
              return Center(child: Text(state.errMessage));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
