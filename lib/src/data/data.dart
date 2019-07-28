import 'package:metsysoce/src/models/banner_model.dart';

List<BannerModel> getBanners() {
  List<BannerModel> banners = [];
  banners.add(BannerModel(
      "You're a",
      "Rookie Bill-E",
      "3/10 bills paid",
      "Learn about Bill-E",
      "assets/goat.png"));
  banners.add(BannerModel(
      "Pay 10 bills to be a",
      "Cadet Bill-E",
      "",
      "Learn about Bill-E",
      "assets/goat2.png"));

  return banners;
}