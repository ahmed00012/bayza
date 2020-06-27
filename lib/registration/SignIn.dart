import 'package:bayza/Home/request.dart';
import 'package:bayza/registration/SignUp.dart';
import 'package:bayza/registration/resetPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool seen = false;


  Color _getColor(String color) {
    return Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: _getColor('#353A50'),
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
            ),
            Text(
              'Welcome',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,

              ),
            ),
            Padding(padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Text('You are a new user ?',style: TextStyle(color: Colors.white60),),
                Text('Join us now !',style: TextStyle(color: Colors.white60),),
              ],
            ),),

            Container(
                width: 280,
                height: 45,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(100.0),
                  ),
                 onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                 },
                  color: _getColor('#F9AA33'),
                  textColor: Colors.white,
                  child: Text('sign up'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 18, fontFamily: 'Lato')),
                )),
            Padding(padding: EdgeInsets.all(12)),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                  width: MediaQuery.of(context).size.width*0.3,
                  height: 1,
                  color: Colors.white60,),
                  Text('  or  ',style: TextStyle(color: Colors.white),),
                  Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    height: 1,
                    color: Colors.white60,),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),


            Container(
              child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText:' Username',
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


                        Padding(padding: EdgeInsets.all(10)),

                        Stack(
                          children: <Widget>[


                            TextFormField(

                              decoration: InputDecoration(
                                  labelText:' Password',
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

                                obscureText: seen,
                            ),

                            Positioned(
                              child: IconButton(
                                icon: Icon(seen==true?Icons.visibility_off:Icons.visibility,
                                  size: 22,
                                color: Colors.white,),
                                onPressed: ()async{
                                  setState(() {
                                    seen=!seen;
                                  });

                                },

                              ),
                              right:2,
                              top:12,
                            )
                          ],
                        ),

                      Padding(padding: EdgeInsets.all(10)),
                        InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>ResetPassword()));
                            },
                            child: Text('Forgot your password ?',
                              style: TextStyle(color: Colors.white70),)),
                        Padding(padding: EdgeInsets.all(10)),
                        Container(
                            width: 280,
                            height: 45,
                            child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(100.0),
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder:(context)=>Request()));
                              },
                              color: _getColor('#F9AA33'),
                              textColor: Colors.white,
                              child: Text('Log In'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'Lato')),
                            )),

                      ],
                    ),
                  )
              ),

            )

          ],
        ),
      ),
    );
  }
}
