import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  Color _getColor(String color) {
    return Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Reset Password',style: TextStyle(color: Colors.white,),),
        elevation: 0.0,
        backgroundColor:_getColor('#353A50') ,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: _getColor('#353A50'),
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(40)),
            SvgPicture.asset('assets/images/Group624.svg',),
            Padding(padding: EdgeInsets.all(15)),
            Container(
                width: MediaQuery.of(context).size.width*0.8,

                child: Text('Enter your registered email address to send you password reset',
                  textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),)),
            Padding(padding: EdgeInsets.all(15)),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText:' Email Address',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: _getColor('#DEDEDE')
                      ),),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: _getColor('#DEDEDE')
                      ),)
                ),


              ),
            ),
            Padding(padding: EdgeInsets.all(15)),
            Container(
                width: 280,
                height: 45,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(100.0),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  color: _getColor('#F9AA33'),
                  textColor: Colors.white,
                  child: Text('Send'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 18, fontFamily: 'Lato')),
                )),

          ],
        ),
      ),

    );
  }
}
