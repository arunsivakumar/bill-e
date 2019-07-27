import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
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
    return Scaffold(
      body: Center(
          child: FutureBuilder<List<Bill>>(
            future: getBills(), //sets the getBills method as the expected Future
            builder: (context, snapshot) {
              if (snapshot.hasData) { //checks if the response returns valid data
                return Center(
                  child: Column(
                    children: <Widget>[
                      Text(snapshot.data.first.billerIcon), //displays the billerName
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(" - ${snapshot.data.first.billerName}"), //displays the amount
                    ],
                  ),
                );
              } else if (snapshot.hasError) { //checks if the response throws an error
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
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
  String url = 'http://192.168.0.197:4000/metsysoce/bills/id';
  final response =
  await http.get(url, headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    return parseBills(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}
