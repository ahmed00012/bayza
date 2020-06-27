import 'package:flutter/material.dart';


class Requests extends StatefulWidget {

  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  Color _getColor(String color) {
    return Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _getColor('#353A50'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0,
        title: Text(
          'Requests',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),

      body: Container(

      ),
    );
  }
}
