import 'dart:async';

import 'package:image_search_app/data/pixabay_api.dart';

import '../model/photo.dart';

class HomeViewModel {
  final PixabayApi api;

  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  HomeViewModel(this.api);

  Future fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }
}
