import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:bayza/Home/request.dart';



enum Page { user, winch }

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Color _getColor(String color) {
    return Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }

  TextEditingController birth = TextEditingController();
  TextEditingController birth1 = TextEditingController();

  Page _selectedPage = Page.user;
  bool activeUser = true;
  bool activeWinch = false;
  bool seen = false;
  bool isChecked = true;

  int year;
  int month;
  int day;

  _currentDate() {
    if (_selectedPage == Page.user && birth.text == '') {
      return DateTime(2000, 1, 1);
    }

    if (_selectedPage == Page.winch && birth1.text == '') {
      return DateTime(2000, 1, 1);
    }

    if (_selectedPage == Page.user && birth.text != '') {
      return DateTime(year, month, day);
    }

    if (_selectedPage == Page.winch && birth1.text != '') {
      return DateTime(year, month, day);
    }
  }

  _getDate() async {
    DateTime date = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1960, 1, 1),
      maxTime: DateTime(2015, 12, 31),
      onChanged: (date) {
        print('change $date');
      },
      currentTime: _currentDate(),
      onConfirm: (date) {
        print('confirm $date');
        if (_selectedPage == Page.user)
          birth.text = date.year.toString() +
              '-' +
              date.month.toString() +
              '-' +
              date.day.toString();
        else
          birth1.text = date.year.toString() +
              '-' +
              date.month.toString() +
              '-' +
              date.day.toString();
      },
    );

    setState(() {
      year = date.year;
      month = date.month;
      day = date.day;
    });

    return date.toString();
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    year = DateTime.now().year;
    month = DateTime.now().month;
    day = DateTime.now().day;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: _getColor('#353A50'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0.0,
          title: Text(
            'Sign UP',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: _getColor('#353A50'),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 30)),
                Container(
                  width: double.infinity,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              activeUser = true;
                              activeWinch = false;

                              _selectedPage = Page.user;
                            });
                          },
                          child: activeUser
                              ? Stack(
                                  alignment: Alignment.topCenter,
                                  children: <Widget>[
                                    SvgPicture.asset(
                                        'assets/images/Group363.svg'),
                                    Column(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(top: 10)),
                                        SvgPicture.asset(
                                            'assets/images/user.svg'),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5)),
                                        Text(
                                          'User',
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              : Column(
                                  children: <Widget>[
                                    Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        SvgPicture.asset(
                                            'assets/images/Ellipse331.svg',
                                            color: Colors.black38),
                                        Column(
                                          children: <Widget>[
                                            SvgPicture.asset(
                                                'assets/images/user.svg'),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5)),
                                            Text(
                                              'User',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 30)),
                        InkWell(
                          onTap: () {
                            setState(() {
                              activeWinch = true;
                              activeUser = false;

                              _selectedPage = Page.winch;
                            });
                          },
                          child: activeWinch
                              ? Stack(
                                  alignment: Alignment.topCenter,
                                  children: <Widget>[
                                    SvgPicture.asset(
                                        'assets/images/Group363.svg'),
                                    Column(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(top: 10)),
                                        SvgPicture.asset(
                                          'assets/images/winch.svg',
                                          height: 30,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5)),
                                        Text(
                                          'Winch',
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              : Column(
                                  children: <Widget>[
                                    Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        SvgPicture.asset(
                                          'assets/images/Ellipse331.svg',
                                          color: Colors.black38,
                                        ),
                                        Column(
                                          children: <Widget>[
                                            SvgPicture.asset(
                                              'assets/images/winch.svg',
                                              height: 30,
                                              color: Colors.white,
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5)),
                                            Text(
                                              'Winch',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 30)),
                      ],
                    ),
                  ),
                ),
                _loadScreen(),
              ],
            ),
          ),
        ));
  }

  Widget _loadScreen() {
    switch (_selectedPage) {
      case Page.user:
        return Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                hintText: "Name",
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.black45,
                                ),
                              ),
                              cursorColor: Colors.black26,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                hintText: "Phone",
                                icon: Icon(
                                  Icons.phone_iphone,
                                  color: Colors.black45,
                                ),
                              ),
                              cursorColor: Colors.black26,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                hintText: "Email",
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.black45,
                                ),
                              ),
                              cursorColor: Colors.black26,
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: TextFormField(
                                  obscureText: !seen,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: "Password",
                                    icon: Icon(
                                      Icons.lock_outline,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "password cannot be empty";
                                    }
                                    if (value.length < 6) {
                                      return "password has to be at least 6 characters";
                                    }
                                    return null;
                                  },
                                  cursorColor: Colors.black26,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: IconButton(
                              icon: Icon(
                                seen == true
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 22,
                                color: Colors.black45,
                              ),
                              onPressed: () async {
                                setState(() {
                                  seen = !seen;
                                });
                              },
                            ),
                            right: 5,
                            top: 10,
                          )
                        ],
                      ),
                      InkWell(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.8),
                            child: Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: TextFormField(
                                controller: birth,
                                readOnly: true,
                                onTap: () {
                                  _getDate();
                                },
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  hintText: "Date of Birth",
                                  icon: Icon(
                                    Icons.date_range,
                                    color: Colors.black45,
                                  ),
                                ),
                                cursorColor: Colors.black26,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: DropdownButtonFormField(
                              hint: Text('City'),
                              iconDisabledColor: Colors.black45,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.location_city,
                                  color: Colors.black45,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                      onTap: () {
          setState(() {
          isChecked = !isChecked;
          });
          },
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color:_getColor("#F9AA33") ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: isChecked
                    ? Icon(
                  Icons.check,
                  size: 20.0,
                  color: Colors.white,
                )
                    : Icon(
                  Icons.check_box_outline_blank,
                  size: 20.0,
                  color: _getColor("#F9AA33"),
                ),
              ),
            ),
          ),
                          Padding(padding: EdgeInsets.all(7)),

                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width*0.7,
                            padding:EdgeInsets.only(top:5),
                            alignment: Alignment.center,
                            child: Text(
                              'By creating an account you agree to our Terms of Service and Privacy Policy',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white.withOpacity(0.8)),
                            ),
                          )
                        ],
                      ),
                        Padding(padding: EdgeInsets.all(10)),
                      Container(
                          width: 280,
                          height: 45,
                          child: RaisedButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius:
                              new BorderRadius.circular(100.0),
                            ),
                            onPressed: () async {
                              Navigator.push(context, MaterialPageRoute(builder:(context)=>Request()));
                            },
                            color: _getColor("#F9AA33"),
                            textColor: Colors.white,
                            child: Text('SIGNUP',
                                style: TextStyle(
                                    fontSize: 18,fontWeight: FontWeight.w500)),
                          )),

                    ],
                  )),
                )
              ],
            ),
          ),
        );

      case Page.winch:
        return Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: "Name",
                                    icon: Icon(
                                      Icons.person,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  cursorColor: Colors.black26,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: "Phone",
                                    icon: Icon(
                                      Icons.phone_iphone,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  cursorColor: Colors.black26,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: "Email",
                                    icon: Icon(
                                      Icons.email,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  cursorColor: Colors.black26,
                                ),
                              ),
                            ),
                          ),
                          Stack(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white.withOpacity(0.8),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 12),
                                    child: TextFormField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        hintText: "Password",
                                        icon: Icon(
                                          Icons.lock_outline,
                                          color: Colors.black45,
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "password cannot be empty";
                                        }
                                        if (value.length < 6) {
                                          return "password has to be at least 6 characters";
                                        }
                                        return null;
                                      },
                                      cursorColor: Colors.black26,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                child: IconButton(
                                  icon: Icon(
                                    seen == true
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 22,
                                    color: Colors.black45,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      seen = !seen;
                                    });
                                  },
                                ),
                                right: 5,
                                top: 10,
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: "National ID",
                                    icon: Icon(
                                      Icons.card_membership,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  cursorColor: Colors.black26,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    hintText: "Winch Number",
                                    icon: Icon(
                                      Icons.local_car_wash,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  cursorColor: Colors.black26,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: DropdownButtonFormField(
                                  hint: Text('City'),
                                  iconDisabledColor: Colors.black45,
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.location_city,
                                      color: Colors.black45,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(shape: BoxShape.circle, color:_getColor("#F9AA33") ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: isChecked
                                        ? Icon(
                                      Icons.check,
                                      size: 20.0,
                                      color: Colors.white,
                                    )
                                        : Icon(
                                      Icons.check_box_outline_blank,
                                      size: 20.0,
                                      color: _getColor("#F9AA33"),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(7)),

                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width*0.7,
                                padding:EdgeInsets.only(top:5),
                                alignment: Alignment.center,
                                child: Text(
                                  'By creating an account you agree to our Terms of Service and Privacy Policy',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white.withOpacity(0.8)),
                                ),
                              )
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(10)),
                          Container(
                              width: 280,
                              height: 45,
                              child: RaisedButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius:
                                  new BorderRadius.circular(100.0),
                                ),
                                onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>Request()));
                                },
                                color: _getColor("#F9AA33"),
                                textColor: Colors.white,
                                child: Text('SIGNUP',
                                    style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w500)),
                              )),

                        ],
                      )),
                )
              ],
            ),
          ),
        );
    }
  }
}
