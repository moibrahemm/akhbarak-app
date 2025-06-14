import 'package:akhbarak_app/extensions/size_extension.dart';
import 'package:akhbarak_app/models/article_model.dart';
import 'package:akhbarak_app/widgets/news_web_view.dart';
import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return NewsWebview(url: articleModel.url);
            },
          ),
        );
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.network(
              articleModel.img,
              height: context.height * 0.25,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: context.height * 0.25,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.broken_image,
                    size: 50,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Text(
            articleModel.title,
            textDirection: TextDirection.rtl,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black87,
              fontSize: context.height * 0.020,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            articleModel.subtitle,
            maxLines: 2,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Colors.grey,
              fontSize: context.height * 0.016,
            ),
          ),
        ],
      ),
    );
  }
}
