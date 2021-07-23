import 'package:flutter/material.dart';
import 'package:music_app/Model/Post.dart';
import 'package:music_app/View_model/List_of_view_mode.dart';
import 'package:music_app/View_model/ProviderData.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  static String id = 'HomeView';

  List<Post> p = [];
  Future help(BuildContext context) async {
    try {
      final news = Provider.of<ArticlesOfViewModel>(context);
      await news.fatchData();
      p = news.post;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeigt = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var currentIndex = Provider.of<Data>(context);
    help(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(' اخبارى '),
      ),
      body: ListView.builder(
        itemCount: p.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: GestureDetector(
              onTap: () async {
                await launch(p[index].url);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: Colors.brown[200]),
                height: screenHeigt * .3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: screenHeigt * .3,
                      width: screenWidth * .5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${p[index].title}",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("${p[index].urlToImage}"),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(
                            20,
                          )),
                      height: screenHeigt * .28,
                      width: screenWidth * .4,
                      // child: Image(
                      //   image: NetworkImage("${p[index].urlToImage}"),
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
