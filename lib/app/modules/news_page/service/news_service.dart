import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/news_model.dart';

class NewsService {
  static var client = http.Client();

  static Future<List<NewsModel>> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=tr&apiKey=a999147cbcfc4a6c8e92df5d3bda1730'));
    if (response.statusCode == 200) {
      Map<String, dynamic> values = json.decode(response.body);
      List<NewsModel> news = List<NewsModel>.from(
          values["responseData"]["cities"].map((x) => NewsModel.fromJson(x)));
      return news;
    } else {
      print("error while reading news data");
      return [];
    }
  }
}
