import 'dart:async';
import 'package:bayza/registration/SignIn.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {

      Navigator.push(context, MaterialPageRoute(
          builder: (context) => SignIn()));


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,

            width: double.infinity,
            child: Image.asset(
              'assets/images/1.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Container(
                width: 250,
                height: 180,
                child: Image.asset('assets/images/Rectangle 192.png',fit: BoxFit.fill,)),
          )
        ],
      ),
    );


  }
}
