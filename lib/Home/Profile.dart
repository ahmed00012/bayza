import 'package:bayza/EditProfile.dart';
import 'package:bayza/Home/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Color _getColor(String color) {
    return Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Home())),
        child: Container(

          width: double.infinity,

          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
Container(
  height: MediaQuery.of(context).size.height*0.3,
  width: double.infinity,
  color: _getColor('#353A50'),

  child: Column(
    children: <Widget>[
        Padding(padding: EdgeInsets.all(20),),
        CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: SvgPicture.asset('assets/images/Path 938.svg',height: 55,),

        ),
        Padding(padding: EdgeInsets.all(5)),
        Text('John Doe',style: TextStyle(color: Colors.white70,fontSize: 18,fontWeight: FontWeight.bold),),
        Padding(padding: EdgeInsets.all(2)),
        Text('Johndoe@yahoo.com',style: TextStyle(color: Colors.white70,fontSize: 16),)
    ],
  ),
),
Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Column(
    children: <Widget>[

        Container(
            height: 40,
            child: Row(
              children: <Widget>[
                Icon(Icons.account_balance_wallet,color: Colors.black54,),
                Padding(padding: EdgeInsets.all(7)),
                Text('Wallet',style: TextStyle(fontSize: 16),),
                Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.5)),
                Text('0 EGP',style: TextStyle(color: Colors.black54),)
              ],
            ),
        ),
        Divider(),

        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
          },
          child: Container(
              height: 40,
              child: Row(
                children: <Widget>[
                  Icon(Icons.settings,color: Colors.black54,),
                  Padding(padding: EdgeInsets.all(7)),
                  Text('Edit Profile',style: TextStyle(fontSize: 16),),

                ],
              ),
          ),
        ),
        Divider(),

        Container(
            height: 40,
            child: Row(
              children: <Widget>[
                Icon(Icons.language,color: Colors.black54,),
                Padding(padding: EdgeInsets.all(7)),
                Text('Change Language',style: TextStyle(fontSize: 16),),

              ],
            ),
        ),
        Divider(),

        Container(
            height: 40,
            child: Row(
              children: <Widget>[
                Icon(Icons.description,color: Colors.black54,),
                Padding(padding: EdgeInsets.all(7)),
                Text('Terms and Conditions ',style: TextStyle(fontSize: 16),),

              ],
            ),
        ),
        Divider(),


        Container(
            height: 40,
            child: Row(
              children: <Widget>[
                Icon(Icons.phone,color: Colors.black54,),
                Padding(padding: EdgeInsets.all(7)),
                Text('Contact us ',style: TextStyle(fontSize: 16),),

              ],
            ),
        ),
        Divider(),





        Container(
            height: 40,
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                    'assets/images/logout.svg',color: Colors.black54,),
                Padding(padding: EdgeInsets.all(7)),
                Text('Logout ',style: TextStyle(fontSize: 16),),

              ],
            ),
        ),
        Divider(),


    ],
  ),
)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
