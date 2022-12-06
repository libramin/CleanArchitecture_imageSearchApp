import 'package:image_search_app/data/data_source/result.dart';
import 'package:image_search_app/domain/repository/photo_api_repo.dart';

import '../../domain/model/photo.dart';
import '../data_source/pixabay_api.dart';

class PhotoApiRepoImpl implements PhotoApiRepo {
  PixabayApi api;

  PhotoApiRepoImpl(this.api);

  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    final Result<Iterable> result = await api.fetch(query);

    return result.when(
      success: (iterable) {
        return Result.success(iterable.map((e) => Photo.fromJson(e)).toList());
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
