import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app/data/photo_api_repo.dart';
import 'package:image_search_app/model/photo.dart';
import 'package:image_search_app/ui/home_view_model.dart';

void main() {
  test('stream 동작 확인', () async {
    final viewModel = HomeViewModel(FakePhotoApiRepo());

    await viewModel.fetch('apple');

    final result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(viewModel.photos, result);

  });
}

class FakePhotoApiRepo extends PhotoApiRepo {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));

    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 634572,
    "pageURL":
        "https://pixabay.com/photos/apples-fruits-red-ripe-vitamins-634572/",
    "type": "photo",
    "tags": "apples, fruits, red",
    "previewURL":
        "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
    "previewWidth": 100,
    "previewHeight": 150,
    "webformatURL":
        "https://pixabay.com/get/gb6bd0ff21e3dfc907083c85f55fca6986856ef2529d0a718d5fadca6bae6f7dff64e5ed92ea116764b065168c7462112_640.jpg",
    "webformatWidth": 427,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/g56bea9989105123fdf09ef879969ff5c84cb9c5d1a8ce470793ef9e90ad5ff8f89edbcbb2ef744daa414cb4f950904f548b9ac773b348ec893a62b3988ed1cee_1280.jpg",
    "imageWidth": 3345,
    "imageHeight": 5017,
    "imageSize": 811238,
    "views": 450994,
    "downloads": 258950,
    "collections": 1241,
    "likes": 2329,
    "comments": 188,
    "user_id": 752536,
    "user": "Desertrose7",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/14/13-25-18-933_250x250.jpg"
  },
  {
    "id": 1868496,
    "pageURL":
        "https://pixabay.com/photos/apple-computer-desk-workspace-1868496/",
    "type": "photo",
    "tags": "apple, computer, desk",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g2ac771c2f9c88703a342f6fbb997ab846d9287a7a10a78571e19d4c46d4706af0d82b9c459f385c1bb131913a600379fd9fb5fb376552a6b3706c711eddb895e_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/gec5711fb8b1a140ea47a9f79d17da99d9e59f718e846deab05d2a08badd55e8666ac7a6a9d377d308d44b4119b33bd63d8ce5810962d5649ae57913a5300f701_1280.jpg",
    "imageWidth": 5184,
    "imageHeight": 3456,
    "imageSize": 2735519,
    "views": 646944,
    "downloads": 469197,
    "collections": 1337,
    "likes": 999,
    "comments": 270,
    "user_id": 2286921,
    "user": "Pexels",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/03/26/22-06-36-459_250x250.jpg"
  },
];
