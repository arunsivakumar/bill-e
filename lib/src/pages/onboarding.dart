import 'package:flutter/material.dart';
import 'package:metsysoce/src/utils/spotlight_carousel.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    AssetImage circleslifeAsset = AssetImage('assets/icons/circleslife.png');
    AssetImage netflixAsset = AssetImage('assets/icons/netflix.png');
    AssetImage spotifyAsset = AssetImage('assets/icons/spotify.png');
    AssetImage billeAsset = AssetImage('assets/icons/bille.png');
    Image circleslife = Image(image: circleslifeAsset, width: 64, height: 64);
    Image netflix = Image(image: netflixAsset, width: 64, height: 64);
    Image spotify = Image(image: spotifyAsset, width: 64, height: 64);
    Image bille = Image(image: billeAsset, width: 64, height: 64);
    List<Image> images = [
      bille,
      circleslife,
      netflix,
      spotify,
    ];
    List<String> titles = [
      "Subscriptions", "Subscriptions", "Subscriptions", "Subscriptions"];
    List<String> descriptions = [
      "Track all your recurring \n payments hassle-free",
      "Track all your recurring \n payments hassle-free",
      "Track all your recurring \n payments hassle-free",
      "Track all your recurring \n payments hassle-free"];
    return SpotlightCarousel(
      images: images,
      titles: titles,
      descriptions: descriptions,
    );
  }

}

