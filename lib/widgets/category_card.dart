import 'package:akhbarak_app/extensions/size_extension.dart';
import 'package:akhbarak_app/models/category_model.dart';
import 'package:akhbarak_app/screens/category_view.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(
                category: widget.category.categoryName.toLowerCase(),
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10.0),
        width: context.width * 0.5,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            opacity: 0.85,
            image: AssetImage(widget.category.imageUrl),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              widget.category.categoryName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: context.height * 0.025,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
