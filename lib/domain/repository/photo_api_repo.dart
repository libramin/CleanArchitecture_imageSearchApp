

import '../model/photo.dart';

abstract class PhotoApiRepo {
  Future<List<Photo>> fetch(String query);
}