import 'package:flutter/material.dart';
import 'package:net_objex_test/api.dart';
import 'package:net_objex_test/register_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserLogin extends StatefulWidget {
  createState() {
    return LoginState();
  }
}

class LoginState extends State<UserLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Login'),
          centerTitle: true,
        ),
        body:Center(
          child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 50,),
                ),
                Container(
                    margin: EdgeInsets.only(left: 30,right: 30),
                    child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: 'Email', 
                        hintText: 'you@email.com',
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
                        border: OutlineInputBorder()),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20,left: 20),
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: () {
                    api demoApi = new api();

                    Users _user = new Users();
                    _user.email = emailController.text;
                    _user.password=passController.text;
                  

                    if (demoApi.validateUser(_user)) {
                      Fluttertoast.showToast(
                              msg: "Login Successfull!!!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                      );
                      Navigator.of(context).pushReplacementNamed('/homeScreen');
                    }
                    else{
                      // redirct to some where els.
                      Fluttertoast.showToast(
                              msg: "Email or Password incorrect!!!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                      );
                    }
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                ),
                InkWell(
                  child: Text('Not a member ? Sign Up'),
                  onTap: () {
                
                     Navigator.of(context).pushReplacementNamed('/userReg');
                    
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
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
