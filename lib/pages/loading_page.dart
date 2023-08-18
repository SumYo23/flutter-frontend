import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TabPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      color: Color(0xff9EDAFB),
      child: Center(
        child: Container(
            padding: EdgeInsets.all(100),
            child: Image.asset('assets/sumyo logo.png')),
      ),
    );
  }
}
