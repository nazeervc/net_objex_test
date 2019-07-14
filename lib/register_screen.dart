import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'api.dart';

class Users {
  String name;
  String place;
  String email;
  String mobile;
  String password;

  Users({this.name, this.place, this.email, this.mobile, this.password});

  factory Users.fromJson(Map<String, dynamic> json) => Users(
      name: json["name"],
      place: json["place"],
      email: json["email"],
      mobile: json["mobile"],
      password: json['password']);

  Map<String, dynamic> toJson() => {
        "name": name,
        "place": place,
        "email": email,
        "mobile": mobile,
        "password": password
      };
}
class UserRegister extends StatefulWidget {
  createState() {
    return RegisterState();
  }
}

class RegisterState extends State<UserRegister> {
  bool _validate = false;
  
  TextEditingController nameController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Register'),
          centerTitle: true,
        ),
        body:Center(
          child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 50),
                ),
                Container(
                    margin: EdgeInsets.only(left: 30,right: 30),
                    child: TextField(
                    controller: nameController,
                    decoration:
                        InputDecoration(labelText: 'Name', 
                        hintText: 'your name',
                        errorText: _validate ? 'Name Can\'t Be Empty' : null,
                        border: OutlineInputBorder()
                        ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                ),
                Container(
                    margin: EdgeInsets.only(left: 30,right: 30),
                    child: TextField(
                    controller: placeController,
                    decoration:
                        InputDecoration(
                        labelText: 'Place', 
                        hintText: 'banglore',
                        errorText: _validate ? 'Place Can\'t Be Empty' : null,
                        border: OutlineInputBorder()
                        ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                ),
                Container(
                    margin: EdgeInsets.only(left: 30,right: 30),
                    child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: 'Email', 
                        hintText: 'you@email.com',
                        errorText: _validate ? 'Email Can\'t Be Empty' : null,
                        border: OutlineInputBorder()
                        ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,left:20,right:20),
                ),
                Container(
                    margin: EdgeInsets.only(left: 30,right: 30),
                    child: TextField(
                    controller: mobileController,
                    decoration: InputDecoration(
                        labelText: 'Mobile', 
                        hintText: '9008 000 000',
                        errorText: _validate ? 'Mobile Can\'t Be Empty' : null,
                        border: OutlineInputBorder()
                        ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                ),
                Container(
                    margin: EdgeInsets.only(left: 30,right: 30),
                    child: TextField(
                      obscureText: true,
                    controller: passController,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'password',
                        errorText: _validate ? 'Password Can\'t Be Empty' : null,
                        border: OutlineInputBorder()
                        ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                ),
                RaisedButton(
                  child: Text('REGISTER'),
                  onPressed: () {
                      // add to list
                      api demoApi = new api();
                      Users _user = new Users();
                      _user.name = nameController.text;
                      _user.place=placeController.text;
                      _user.email=emailController.text;
                      _user.mobile=mobileController.text;
                      _user.password=passController.text;

                      setState(() {
                  nameController.text.isEmpty ? _validate = true : _validate = false;
                  placeController.text.isEmpty ? _validate = true : _validate = false;
                  emailController.text.isEmpty ? _validate = true : _validate = false;
                  mobileController.text.isEmpty ? _validate = true : _validate = false;
                  passController.text.isEmpty ? _validate = true : _validate = false;
                });

                      if (demoApi.add(_user)) {
                               Fluttertoast.showToast(
                               msg: "Registered Successfully!!!",
                               toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0
                            );
                        Navigator.of(context).pushReplacementNamed('/userLog');
                        
                        
                      }
                      else{
                        // redirect to error or validation page.
                        Fluttertoast.showToast(
                               msg: "All the fields are mandatory!!!",
                               toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.yellow,
                              textColor: Colors.white,
                              fontSize: 16.0
    );
                      }
                  },
                ),
                
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }
}
