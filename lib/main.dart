import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen()); // define it once at root level.
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Testing",
        home: Scaffold(
          body: Center(
            child: Text(
              "PreOrder",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          backgroundColor: Colors.white,
        ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget menuTitle = Container(
      padding: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),
      child: Row(
        children: <Widget>[
          Text(
            "Menu",
            style: TextStyle(
                color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );

    Widget menuSection = Container(
      padding: EdgeInsets.all(10.0),
      height: 60.0,
      child: Center(
          child: ListView(
        children: <Widget>[
          Container(
              height: 40,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(10, (int index) {
                    return Card(
                      color: Colors.orange[800],
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "hello how r u",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    );
                  })))
        ],
      )),
    );

    Widget popularTitle = Container(
      padding: EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 0.0),
      child: Row(
        children: <Widget>[
          Text(
            "Popular",
            style: TextStyle(
                color: Colors.red, fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );

    Widget popularSection = Container(
      padding: EdgeInsets.all(10.0),
      height: 600.0,
      child: Center(
          child: ListView(
        children: <Widget>[
          Container(
              height: 600.0,
              child: ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(10, (int index) {
                    return Card(
                      color: Colors.orange[800],
                      child: Container(
                        height: 120.0,
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                'https://assets3.thrillist.com/v1/image/2797371/size/tmg-article_default_mobile.jpg',
                                width: 60,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })))
        ],
      )),
    );

    return MaterialApp(
        title: "Testing",
        home: Scaffold(
          body: Container(
            child: ListView(
              children: <Widget>[
                menuTitle,
                menuSection,
                popularTitle,
                popularSection,
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ));
  }
}
