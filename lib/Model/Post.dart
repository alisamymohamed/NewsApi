class Post {
  String title;
  String description;
  String url;
  String urlToImage;

  Post({this.title, this.description, this.url, this.urlToImage});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage']);
  }
}
