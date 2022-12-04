import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search_app/domain/repository/photo_api_repo.dart';

import '../../domain/model/photo.dart';

class HomeViewModel with ChangeNotifier{
  final PhotoApiRepo repo;

  List<Photo> _photos = [];

  //외부에서 재정의는 못하나, add/clear 가능
  // List<Photo> get photos => _photos;

  //수정하지 못하는 리스트뷰 생성 (ex.정의,add,clear불가)
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  HomeViewModel(this.repo);

  Future fetch(String query) async {
    final result = await repo.fetch(query);
    _photos = result;
    notifyListeners();
  }

}
