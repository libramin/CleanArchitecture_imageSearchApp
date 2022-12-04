
import 'package:image_search_app/domain/repository/photo_api_repo.dart';

import '../../domain/model/photo.dart';
import '../data_source/pixabay_api.dart';

class PhotoApiRepoImpl implements PhotoApiRepo{
  PixabayApi api;

  PhotoApiRepoImpl(this.api);

  @override
  Future<List<Photo>> fetch(String query) async {
    final result = await api.fetch(query);
    return result.map((e) => Photo.fromJson(e)).toList();
  }
}