import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/news_model.dart';

class NewsProvider extends GetConnect {
  static var client = http.Client();

  Future<List<NewsModel>> getNews() async {
    final response = await get(
        "https://newsapi.org/v2/top-headlines?country=tr&apiKey=a999147cbcfc4a6c8e92df5d3bda1730");
    if (response.statusCode == 200) {
      Map<String, dynamic> values = json.decode(response.body);
      List<NewsModel> news = List<NewsModel>.from(
          values["responseData"]["cities"].map((x) => NewsModel.fromJson(x)));
      return news;
    } else {
      print("error while getNews");
      return [];
    }
  }
}
