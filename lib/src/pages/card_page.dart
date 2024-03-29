import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:metsysoce/src/utils/screen_size.dart';
import 'package:http/http.dart' as http;

class CardPage extends StatefulWidget {
  CardPage({Key key}) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Notifications',
      style: optionStyle,
    ),
    Text(
      'Index 1: Home',
      style: optionStyle,
    ),
    Text(
      'Index 2: Credit Card',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
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
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              userCard("Cash", 35.170, 1, context,Colors.transparent),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Text(
                "LINKED TO",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              cardDetails("\n**** **** **** 1234                            Change", 35.170, 1, context,Colors.black),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Text(
                "Spending",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              chart("", 35.170, 1, context,Colors.transparent),
            ],
          ),

          Row(
            children: <Widget>[
              colorCard("Today's Savings", 5.67, 1, context,Colors.black),
              colorCard("Overall Savings", 35.170, 1, context,Colors.black),
            ],
          ),

          SizedBox(
            height: 30,
          )

        ],
      ),
    );
  }
}

Widget cardImage(){
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bill-e.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: null /* add child content here */,
    ),
  );
}

Widget chart(
    String text, double amount, int type, BuildContext context, Color color) {
  final _media = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: 15, right: 15),
    //padding: EdgeInsets.all(15),
    height: screenAwareSize(200, context),
    width: _media.width - 50 ,
    decoration: BoxDecoration(
        color: color,
        image: DecorationImage(
          image: AssetImage("assets/spending.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 16,
              spreadRadius: 0.2,
              offset: Offset(0, 8)),
        ]),
  );
}


Widget masterCard(
    String text, double amount, int type, BuildContext context, Color color) {
  final _media = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: 15, right: 15),
    //padding: EdgeInsets.all(15),
    height: 28,
    width: 45 ,
    decoration: BoxDecoration(
        color: color,
        image: DecorationImage(
          image: AssetImage("assets/mastercard.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 16,
              spreadRadius: 0.2,
              offset: Offset(0, 8)),
        ]),
  );
}

Widget userCard(
    String text, double amount, int type, BuildContext context, Color color) {
  final _media = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: 15, right: 15),
    //padding: EdgeInsets.all(15),
    height: screenAwareSize(150, context),
    width: _media.width - 50 ,
    decoration: BoxDecoration(
        color: color,
        image: DecorationImage(
          image: AssetImage("assets/bill-e.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 16,
              spreadRadius: 0.2,
              offset: Offset(0, 8)),
        ]),
  );
}

Widget cardDetails(
    String text, double amount, int type, BuildContext context, Color color) {
  final _media = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: 8, right: 15),
    padding: EdgeInsets.all(15),
    height: screenAwareSize(70, context),
    width: _media.width - 50,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          'assets/mastercard.png', width: 50.0, height: 28.0,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}


Widget usageChart(
    String text, double amount, int type, BuildContext context, Color color) {
  final _media = MediaQuery.of(context).size;
  return Container(
      margin: EdgeInsets.only(top: 15, right: 15),
      //padding: EdgeInsets.all(15),
      height: screenAwareSize(300, context),
      width: _media.width - 50 ,
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
  );
}

Widget usageAmount(
    String text, double amount, int type, BuildContext context, Color color) {
  final _media = MediaQuery.of(context).size;
  return Container(
      margin: EdgeInsets.only(top: 15, right: 15),
      //padding: EdgeInsets.all(15),
      height: screenAwareSize(80, context),
      width: _media.width / 2 - 30 ,
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
  );
}

Widget colorCard(
    String text, double amount, int type, BuildContext context, Color color) {
  final _media = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: 15, right: 15),
    padding: EdgeInsets.all(15),
    height: screenAwareSize(120, context),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          'assets/swipe.png', width: 80.0, height: 28.0,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${type > 0 ? "" : "-"} \$${amount.toString()}",
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
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
