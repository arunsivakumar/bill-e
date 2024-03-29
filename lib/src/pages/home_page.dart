import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:metsysoce/src/utils/screen_size.dart';
import 'package:metsysoce/src/data/data.dart';
import 'package:metsysoce/src/widgets/banner_card.dart';
import 'package:metsysoce/src/pages/card_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      homepageWidget(context),
      homepageWidget(context),
      CardPage(),
    ];
    return Scaffold(
//      body: Center(
//          child: FutureBuilder<List<Bill>>(
//            future: getBills(), //sets the getBills method as the expected Future
//            builder: (context, snapshot) {
//              if (snapshot.hasData) { //checks if the response returns valid data
//                return Center(
//                  child: Column(
//                    children: <Widget>[
//                      Text(snapshot.data.first.billerName), //displays the billerName
//                      SizedBox(
//                        height: 10.0,
//                      ),
//                      Text(" - ${snapshot.data.first.billerName}"), //displays the amount
//                    ],
//                  ),
//                );
//              } else if (snapshot.hasError) { //checks if the response throws an error
//                return Text("${snapshot.error}");
//              }
//              return CircularProgressIndicator();
//            },
//          )
//      ),
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            title: Text(''),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan,
        onTap: _onItemTapped,
      ),
    );
  }
}


Widget homepageWidget(BuildContext context) {
  final _media = MediaQuery.of(context).size;
  return ListView(
    physics: BouncingScrollPhysics(),
    padding: EdgeInsets.only(
      left: 20,
      top: 70,
    ),
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "BILL-E",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 25,
      ),
      Row(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                  left: 20,
                ),
                height: _media.longestSide <= 775
                    ? _media.height / 4
                    : _media.height / 4.3,
                width: _media.width - 40,
                child:
                NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowGlow();
                  },
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 10),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: getBanners().length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () => "",
                          child: BannerCard(
                            bannerModel: getBanners()[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ]
      ),
      SizedBox(
        height: 25,
      ),
      Text(
        "Overdue payments",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          inherit: true,
          letterSpacing: 0.4,
        ),
      ),
      Row(
        children: <Widget>[
          colorCard("assets/icons/netflix.png", "2 DAYS", 14.99, 1, context, Color(0xFF626f78)),
          colorCard("assets/sp_icon.png", "4 DAYS", 48.99, 1, context, Color(0xFF626f78)),
        ],
      ),
      SizedBox(
        height: 30,
      ),
      Text(
        "Bills",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          inherit: true,
          letterSpacing: 0.4,
        ),
      ),
      swipeableCard(
        context,
        "assets/icons/netflix.png",
        "Netflix",
        12.99,
        1,
        Colors.grey.shade100,
        Color(0xFFd81f26),
      ),
      swipeableCard(
        context,
        "assets/icons/spotify.png",
        "Spotify",
        9.99,
        -1,
        Colors.grey.shade100,
        Color(0xFF9e9e9e),
      ),
    ],
  );
}

Widget colorCard(
    String iconAsset, String text, double amount, int type,
    BuildContext context, Color color) {
  final _media = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: 15, right: 15),
    padding: EdgeInsets.all(15),
    height: screenAwareSize(75, context),
    width: _media.width / 2 - 25,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 16,
              spreadRadius: 0.2,
              offset: Offset(0, 8)),
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image(
            image: AssetImage(iconAsset), width: 48, height: 48
        ),
        Row(crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.redAccent,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "${type > 0 ? "" : "-"} \$ ${amount.toString()}",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],)
      ],
    ),
  );
}

Widget swipeableCard(BuildContext context, String iconAsset, String name, double amount, int type,
    Color fillColor, Color bgColor) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.25,
    child: Container(
      margin: EdgeInsets.only(
        top: 15,
        right: 20,
      ),
      color: bgColor,
      child: ListTile(
        leading: Image(image: AssetImage(iconAsset), width: 64, height: 64),
        title: Text(name),
        subtitle: Text(amount.toString()),
      ),
    ),
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: 'Pay',
        color: Colors.cyanAccent,
        icon: Icons.payment,
        onTap: () => "",
        closeOnTap: true,
      ),
    ],
  );
}


class Bill {
  final String billerId;
  final String billerName;
  final String billerIcon;
  final double amount;
  final String currency;
  final int billDate;

  Bill({this.billerId, this.billerName, this.billerIcon, this.amount,
    this.currency, this.billDate});

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
        billerId: json['biller_id'],
        billerName: json['biller_name'],
        billerIcon: json['biller_icon'],
        amount: json['amount'] as double,
        currency: json['currency'],
        billDate: json['bill_date']
    );
  }
}

List<Bill> parseBills(Map<String, dynamic> parsedJson) {
  var billsFromJson = parsedJson['result'];
  List<Bill> billsList = new List<Bill>();

  for (var value in billsFromJson) {
    billsList.add(Bill.fromJson(value));
  }
  return billsList;
}

Future<List<Bill>> getBills() async {
  String url = 'https://f1dc19f2.ngrok.io/metsysoce/bills/id';
  final response =
  await http.get(url, headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    return parseBills(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
