import 'package:akhbarak_app/models/article_model.dart';

abstract class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsLoaded extends NewsState {
  final List<ArticleModel> newsList;

  NewsLoaded({required this.newsList});
}

final class NewsFailure extends NewsState {
  final String errMessage;

  NewsFailure({required this.errMessage});
}
