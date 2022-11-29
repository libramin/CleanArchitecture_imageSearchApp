import 'package:flutter/material.dart';
import 'package:image_search_app/ui/widget/image_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const TextField(
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(borderSide: BorderSide())),
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ImageWidget();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
