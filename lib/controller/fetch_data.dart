import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news_page_model.dart';
 const apiKey = "2b33a11de49a44cd87825ac87c98c455";
class ApiServices {
  static Future<NewsPageModel> fetchNews({required String category}) async {
    try {
      String url =
          "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=2b33a11de49a44cd87825ac87c98c455";
      final resposne = await http.get(Uri.parse(url));
      var data = jsonDecode(resposne.body);

      if (resposne.statusCode == 200) {
        return NewsPageModel.fromJson(data);
      } else {
        return NewsPageModel.fromJson(data);
      }
    } on Exception catch (e) {
      print(e);
      rethrow ;
    }
  }
}
