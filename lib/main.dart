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

class HomeScreen extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
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

class HomePage extends State<HomeScreen> {
  int number = 0;

  void subtractNumbers() {
    setState(() {
      number = number - 1;
    });
  }

  void addNumbers() {
    setState(() {
      number = number + 1;
    });
  }

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

    List<String> litems = [
      "1",
      "2",
      "Third",
      "4",
      "1",
      "2",
      "Third",
      "4",
      "1",
      "2",
      "Third",
      "4"
    ];


    Widget menuSection = Container(
      padding: EdgeInsets.all(10.0),
      height: 60.0,
      child: Center(
        child: Container(
          height: 40,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: litems.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return Card(
                  color: Colors.orange[800],
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      litems[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
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
      child: Center(
          child: Container(
        height: 600.0,
        child: ListView.builder(
            itemCount: litems.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return Card(
                child: Container(
                  height: 120.0,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Container(
                                height: 90.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://assets3.thrillist.com/v1/image/2797371/size/tmg-article_default_mobile.jpg')),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                ))),
                        Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.only(left: 10.0, top: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      "Fried Chicken ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "INR 10.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              height: 40,
                              child: Card(
                                color: Colors.orange[800],
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                          child: Icon(Icons.remove),
                                          onPressed: (subtractNumbers)),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Text(
                                            '$number',
                                            style: new TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                              fontFamily: 'Roboto',
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                          child: Icon(Icons.add),
                                          onPressed: (addNumbers)),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              );
            }),
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
