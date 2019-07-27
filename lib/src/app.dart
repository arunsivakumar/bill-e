import 'package:flutter/material.dart';
import 'package:metsysoce/src/pages/home_page.dart';
import 'package:metsysoce/src/pages/card_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
        accentColor: Colors.purpleAccent
      ),
      home: CardPage(),
    );
  }
}

