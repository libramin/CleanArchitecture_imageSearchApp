import 'dart:math';

import 'package:image_search_app/domain/model/photo.dart';
import 'package:image_search_app/domain/repository/photo_api_repo.dart';

import '../../data/data_source/result.dart';

class GetPhotosUseCase {
  final PhotoApiRepo repo;

  GetPhotosUseCase(this.repo);

  Future<Result<List<Photo>>> call(String query)async{
    final result = await repo.fetch(query);

    return result.when(success: (photos){
      return Result.success(photos.sublist(0,min(3,photos.length)));
    }, error: (message){
      return Result.error(message);
    });
  }
}