import 'package:flutter/material.dart';
import 'package:metsysoce/src/pages/onboarding.dart';
import 'package:metsysoce/src/pages/card_page.dart';
import 'package:metsysoce/src/pages/home_page.dart';


import 'package:flutter/services.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
        accentColor: Colors.cyanAccent
      ),
      home: CardPage(),
    );
  }
}

