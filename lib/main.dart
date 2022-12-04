import 'package:flutter/material.dart';
import 'package:image_search_app/data/repository/photo_api_repo_impl.dart';
import 'package:image_search_app/presentation/home/home_screen.dart';
import 'package:image_search_app/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

import 'data/data_source/pixabay_api.dart';
import 'package:http/http.dart'as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ChangeNotifierProvider(
          create: (_) => HomeViewModel(PhotoApiRepoImpl(PixabayApi(http.Client()))),
          child: const HomeScreen()),
    );
  }
}
