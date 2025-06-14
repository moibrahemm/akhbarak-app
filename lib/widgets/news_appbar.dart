import 'package:akhbarak_app/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Akhb',
              style: TextStyle(
                color: Colors.black,
                fontSize: context.height * 0.028,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'arak',
              style: TextStyle(
                color: Colors.amber,
                fontSize: context.height * 0.028,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: '  ',
              style: TextStyle(
                color: Colors.black,
                fontSize: context.height * 0.028,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextSpan(
              text: 'أخبـ',
              style: TextStyle(
                color: Colors.black,
                fontSize: context.height * 0.028,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'ارك',
              style: TextStyle(
                color: Colors.amber,
                fontSize: context.height * 0.028,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
