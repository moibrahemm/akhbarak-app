import 'package:akhbarak_app/cubits/news_cubit/news_state.dart';
import 'package:akhbarak_app/models/article_model.dart';
import 'package:akhbarak_app/services/news_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.newsService) : super(NewsInitial());
  final NewsService newsService;

  Future<void> fetchNews({String category = 'general'}) async {
    emit(NewsLoading());
    try {
      final List<ArticleModel> newsList = await newsService.getNews(
        category: category,
      );
      emit(NewsLoaded(newsList: newsList));
    } on Exception catch (e) {
      emit(NewsFailure(errMessage: 'There was an error : $e'));
    }
  }
}
