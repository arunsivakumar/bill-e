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
      netflix,
      spotify,
      bille,
      circleslife,
    ];
    List<String> titles = [
      "Subscriptions", "Bills", "BILL-E", "BILL-E card"];
    List<String> descriptions = [
      "Manage your Netflix, Spotify (and whatever else, really) subscription and payments in one place.",
      "Keep an eye on all your bills and pay for them through BILL-E.",
      "Finally, an all-in-one app to manage your bills, subscriptions and payments.",
      "Get all your bill and subscription payments onto the BILL-E card. So much simpler."];
    return SpotlightCarousel(
      images: images,
      titles: titles,
      descriptions: descriptions,
    );
  }

}

