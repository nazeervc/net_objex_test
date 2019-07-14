import 'package:flutter/material.dart';
import 'package:net_objex_test/home_screen.dart';
import 'package:net_objex_test/login_screen.dart';
import 'package:net_objex_test/register_screen.dart';

//void main() => runApp(UserRegister());
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'NetObjex Test',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
        home: UserRegister(),
        routes: <String, WidgetBuilder> {
          '/userReg': (BuildContext context) => UserRegister(),
          '/userLog' : (BuildContext context) => UserLogin(),
          '/homeScreen' : (BuildContext context) => HomeScreen(),
        },
      ));
}

