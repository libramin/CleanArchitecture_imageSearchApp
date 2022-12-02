import 'package:image_search_app/model/photo.dart';

abstract class PhotoApiRepo {
  Future<List<Photo>> fetch(String query);
}