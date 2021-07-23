import 'package:flutter/material.dart';
import 'package:music_app/Model/Post.dart';
import 'package:music_app/View_model/List_of_view_mode.dart';
import 'package:music_app/View_model/ProviderData.dart';
import 'package:provider/provider.dart';

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
        itemCount: 2, // p.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: Colors.brown[200]),
                height: screenHeigt * .3,
                child: Column(
                  children: [
                    Text("{p[index].title}"),
                  ],
                )),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "حسابى"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'اخر الاخبار '),
        ],
        currentIndex: currentIndex.currentIndex,
        onTap: (index) {
          currentIndex.changeIndex(index);
        },
      ),
    );
  }
}
