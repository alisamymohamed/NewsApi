import 'package:flutter/material.dart';
import 'package:music_app/Model/Post.dart';
import 'package:music_app/Services/PostService.dart';

class ArticlesOfViewModel extends ChangeNotifier {
  List<Post> _post;
  List<Post> _postByCatedory;

  Future<void> fatchData() async {
    _post = await NewsApi().getArticles();
    notifyListeners();
  }

  Future<void> fatchDataBycategory(String category) async {
    _postByCatedory = await NewsApi().getArticlesByCategory(category);
    notifyListeners();
  }

  List<Post> get post => _post;
  List<Post> get postByCatedory => _postByCatedory;
}
