import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_news_app/models/ArticleModel.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url = 'YOUR_API_KEY';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}
