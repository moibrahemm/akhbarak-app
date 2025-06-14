import 'package:akhbarak_app/extensions/size_extension.dart';
import 'package:akhbarak_app/models/category_model.dart';
import 'package:akhbarak_app/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});
  final List<CategoryModel> itemList = const [
    CategoryModel(imageUrl: 'assets/breaking.jpg', categoryName: 'Breaking'),
    CategoryModel(imageUrl: 'assets/sports.avif', categoryName: 'Sports'),
    CategoryModel(
      imageUrl: 'assets/entertaiment.avif',
      categoryName: 'Entertainment',
    ),
    CategoryModel(imageUrl: 'assets/business.avif', categoryName: 'Business'),
    CategoryModel(imageUrl: 'assets/health.avif', categoryName: 'Health'),
    CategoryModel(imageUrl: 'assets/science.avif', categoryName: 'Science'),
    CategoryModel(
      imageUrl: 'assets/technology.jpeg',
      categoryName: 'Technology',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.14,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemList.length,
        itemBuilder:
            (context, index) => CategoryCard(category: itemList[index]),
      ),
    );
  }
}
