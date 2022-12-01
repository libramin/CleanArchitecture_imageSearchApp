import 'package:flutter/material.dart';
import 'package:image_search_app/data/photo_provider.dart';
import 'package:image_search_app/model/photo.dart';
import 'package:image_search_app/ui/widget/image_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final photoProvider = PhotoProvider.of(context);
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
                        await photoProvider.fetch(_searchController.text);
                      },
                      icon: const Icon(Icons.search)),
                  border: const OutlineInputBorder(borderSide: BorderSide())),
            ),
            StreamBuilder<List<Photo>>(
              stream: photoProvider.photoStream,
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return const Center(child: CircularProgressIndicator());
                }
                final photos = snapshot.data!;
                return Expanded(
                  child: GridView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemCount: photos.length,
                      itemBuilder: (context, index) {
                        final photo = photos[index];
                        return ImageWidget(photo: photo);
                      }),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
