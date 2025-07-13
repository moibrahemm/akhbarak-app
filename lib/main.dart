import 'package:akhbarak_app/cubits/news_cubit/news_cubit.dart';
import 'package:akhbarak_app/screens/home_screen.dart';
import 'package:akhbarak_app/services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const AkhbarakApp());
}

class AkhbarakApp extends StatelessWidget {
  const AkhbarakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(NewsService()),
      child: const MaterialApp(
        title: 'Akhbarak',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
