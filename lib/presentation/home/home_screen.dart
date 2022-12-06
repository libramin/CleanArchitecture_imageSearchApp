import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search_app/presentation/home/components/image_widget.dart';
import 'package:provider/provider.dart';

import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final viewModel = context.read<HomeViewModel>();
      StreamSubscription? _subscription = viewModel.eventStream.listen((event) {
        event.when(showSnackBar : (message){
          final snackBar = SnackBar(content: Text(message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '이미지 검색 앱',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () async {
                        await viewModel.fetch(_searchController.text);
                      },
                      icon: const Icon(Icons.search)),
                  border: const OutlineInputBorder(borderSide: BorderSide())),
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: viewModel.photos.length,
                  itemBuilder: (context, index) {
                    final photo = viewModel.photos[index];
                    return ImageWidget(photo: photo);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
