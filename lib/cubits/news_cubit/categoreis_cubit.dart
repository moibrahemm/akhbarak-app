import 'package:akhbarak_app/cubits/news_cubit/news_state.dart';
import 'package:akhbarak_app/services/news_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryNewsCubit extends Cubit<NewsState> {
  final NewsService newsService;
  CategoryNewsCubit(this.newsService) : super(NewsInitial());

  Future<void> fetchNews(String category) async {
    emit(NewsLoading());
    try {
      final newsList = await newsService.getNews(category: category);
      emit(NewsLoaded(newsList: newsList));
    } catch (e) {
      emit(NewsFailure(errMessage: 'There was an error: $e'));
    }
  }
}
