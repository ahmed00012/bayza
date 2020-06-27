import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';

import 'Home.dart';
import 'Profile.dart';
import 'orders.dart';

class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {




  Color _getColor(String color) {
    return Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
////////////////////////////////Page/////////////////////

  int _selectedIndex = 0;
  bool homeIcon = true;
  bool ordersIcon = false;
  bool profileIcon = false;
  Widget child = Home();

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

///////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    switch (_selectedIndex) {
      case 0:
        child = Home();
        break;
      case 1:
        child = Requests();
        break;
      case 2:
        child = Profile();
        break;
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: new BoxDecoration(
            color: _getColor('#353A50'),
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(50.0),
              topRight: const Radius.circular(50.0),
            )),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: _getColor('#353A50'),
          selectedItemColor: _getColor("#F9AA33"),
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.white, size: 30),
                activeIcon:
                    Icon(Icons.home, color: _getColor("#F9AA33"), size: 30),
                title: Text(
                  'Home',
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.assignment,
                  color: Colors.white,
                  size: 30,
                ),
                activeIcon: Icon(Icons.assignment,
                    color: _getColor("#F9AA33"), size: 30),
                title: Text('Requests')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
                activeIcon:
                    Icon(Icons.person, color: _getColor("#F9AA33"), size: 30),
                title: Text('Profile')),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }


}
