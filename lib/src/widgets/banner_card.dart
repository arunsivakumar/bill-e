import 'package:flutter/material.dart';
import 'package:metsysoce/src/models/banner_model.dart';

class BannerCard extends StatelessWidget {
  final BannerModel bannerModel;

  BannerCard({Key key, this.bannerModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    return Material(
      elevation: 1,
      shadowColor: Colors.grey.shade700,
      color: Colors.grey.shade800,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: _media.width - 40,
            padding: EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  bannerModel.title1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  bannerModel.title2,
                  style: Theme.of(context).textTheme.headline.copyWith(
                    color: Colors.cyanAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bannerModel.title3,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
            ),
          ),
        Material(
          elevation: 4,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/goat.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}