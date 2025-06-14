class ArticleModel {
  final String img;
  final String title;
  final String subtitle;
  final String url;

  ArticleModel({
    required this.img,
    required this.title,
    required this.subtitle,
    required this.url,
  });
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      img: json["image"],
      title: json["title"],
      subtitle: json["description"],
      url: json['url'],
    );
  }
}
