import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search_app/domain/repository/photo_api_repo.dart';
import 'package:image_search_app/presentation/home/home_ui_event.dart';

import '../../data/data_source/result.dart';
import '../../domain/model/photo.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepo repo;

  List<Photo> _photos = [];
  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.repo);

  Future fetch(String query) async {
    _isLoading = true;
    notifyListeners();
    final Result<List<Photo>> result = await repo.fetch(query);

    result.when(
      success: (photos) {
        _photos = photos;
        notifyListeners();
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
    _isLoading = false;
    notifyListeners();
  }
}
