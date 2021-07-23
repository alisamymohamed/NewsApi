import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:music_app/Model/Post.dart';
import 'package:music_app/Model/articles.dart';

class NewsApi {
  List<Post> postList;
  final String apiKey = 'faba8fe5c2234688ae1902bbad850cd6';

  // ignore: missing_return
  Future<List<Post>> getArticles() async {
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&apiKey=$apiKey');
    try {
      http.Response data = await http.get(url);
      if (data.statusCode == 200) {
        Articles articles = Articles.fromjson(json.decode(data.body));
        postList = articles.articles.map((e) => Post.fromJson(e)).toList();
        return postList;
      } else {
        print('error');
      }
    } catch (e) {
      print(e);
    }
  }

  // ignore: missing_return
  Future<List<Post>> getArticlesByCategory(String category) async {
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey');
    try {
      http.Response data = await http.get(url);
      if (data.statusCode == 200) {
        Articles articles = Articles.fromjson(json.decode(data.body));

        postList = articles.articles.map((e) => Post.fromJson(e)).toList();
        return postList;
      } else {
        print('error');
      }
    } catch (e) {
      print(e);
    }
  }
}
