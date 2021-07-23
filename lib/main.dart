import 'package:flutter/material.dart';
import 'package:music_app/Model/Post.dart';
import 'package:music_app/Pages/Home.dart';
import 'package:music_app/View_model/List_of_view_mode.dart';
import 'package:music_app/View_model/ProviderData.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ArticlesOfViewModel>(
          create: (context) => ArticlesOfViewModel(),
        ),
        ChangeNotifierProvider<Data>(
          create: (context) => Data(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('ar', ''), // Spanish, no country code
        ],
        debugShowCheckedModeBanner: false,
        routes: {HomeView.id: (context) => HomeView()},
        initialRoute: HomeView.id,
      ),
    );
  }
}
