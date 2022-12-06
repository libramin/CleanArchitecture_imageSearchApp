import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_app/data/data_source/result.dart';

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';
  static const apiKey = '31741555-b0ed9aca0f7a126912958be4c';

  Future<Result<Iterable>> fetch(String query) async{
    try {
      final response = await client.get(Uri.parse(
          '$baseUrl?key=$apiKey&q=$query&image_type=photo'));
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['hits']; //iterable 반복자
      return Result.success(hits);
    }catch (e){
      return const Result.error('네트워크 에러');
    }
  }

}