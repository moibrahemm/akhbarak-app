import 'package:akhbarak_app/models/article_model.dart';
import 'package:dio/dio.dart';

class NewsService {
  final dio = Dio();
  final String apikey = 'e477a58c20b80d12422f3639133f2abc';

  NewsService();
  Future<List<ArticleModel>> getNews({required String category}) async {
    final Response response = await dio.get(
      'https://gnews.io/api/v4/top-headlines?category=$category&country=eg&lang=ar&apikey=$apikey',
    );
    final Map<String, dynamic> jsonData = response.data;
    final List<ArticleModel> articlesList = List<ArticleModel>.from(
      (jsonData['articles'] as List).map(
        (article) => ArticleModel.fromJson(article),
      ),
    );
    return articlesList;
  }
}
