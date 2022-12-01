
import 'dart:convert';

import '../model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  final baseUrl = 'https://pixabay.com/api/';
  final apiKey = '31741555-b0ed9aca0f7a126912958be4c';

  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(Uri.parse(
        '$baseUrl?key=$apiKey&q=$query&image_type=photo'));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits']; //iterable 반복자
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}