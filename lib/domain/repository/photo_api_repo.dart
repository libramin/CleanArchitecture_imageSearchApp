

import '../../data/data_source/result.dart';
import '../model/photo.dart';

abstract class PhotoApiRepo {
  Future<Result<List<Photo>>> fetch(String query);
}