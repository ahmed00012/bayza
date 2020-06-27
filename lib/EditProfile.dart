import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  Color _getColor(String color) {
    return Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }


  TextEditingController birth = TextEditingController();
  TextEditingController birth1 = TextEditingController();
////////////////////////////date///////////////////////

  bool activeUser = true;
  bool activeWinch = false;
  bool seen = false;
  bool newSeen = false;
  bool isChecked = true;

  int year;
  int month;
  int day;

  _currentDate() {
    if ( birth.text == '') {
      return DateTime(2000, 1, 1);
    }


    if ( birth.text != '') {
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

          birth.text = date.year.toString() +
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

/////////////////////////////////

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
      appBar: AppBar(
        backgroundColor: _getColor('#353A50'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(10,10,10,0),
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
                                      hintText: "Old Password",
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
                                    obscureText: !newSeen,
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
                                      hintText: "New Password",
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
                                  newSeen == true
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 22,
                                  color: Colors.black45,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    newSeen = !seen;
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



                        Padding(padding: EdgeInsets.all(10)),
                        Container(
                            width: 180,
                            height: 45,
                            child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                borderRadius:
                                new BorderRadius.circular(100.0),
                              ),
                              onPressed: () async {},
                              color: _getColor("#F9AA33"),
                              textColor: Colors.white,
                              child: Text('Done',
                                  style: TextStyle(
                                      fontSize: 18,fontWeight: FontWeight.w500)),
                            )),

                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
