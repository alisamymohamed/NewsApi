class Articles {
  List<dynamic> articles;
  Articles({this.articles});
  factory Articles.fromjson(Map<String, dynamic> jsonData) {
    return Articles(articles: jsonData['articles']);
  }
}
