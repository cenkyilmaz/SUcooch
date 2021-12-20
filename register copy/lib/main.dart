import 'dart:html';

import 'package:flutter/material.dart';
import 'package:register/login.dart';
import 'package:register/register.dart';
void main(){
  runApp(MaterialApp(
    home: HomePage(),
  ));
}


class HomePage extends StatelessWidget{
  static Color redd = Colors.redAccent;
  static Color blackk = Colors.black;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "SUCOOCH",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Colors.redAccent
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.asset('images/logo.png'),
                  ),
                  Text(
                    "Welcome to SUCOOCH, the app designed to lower your university travel expenses.",
                    style: TextStyle(fontStyle: FontStyle.italic,
                    color: Colors.redAccent)
                  )

                ],
              ),


              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    color: Colors.redAccent,
                    onPressed:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    },
                    shape: RoundedRectangleBorder(
                        side:BorderSide(
                            color: Colors.black
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(

                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                          fontSize: 50
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    color: Colors.redAccent,
                    minWidth: double.infinity,
                    height: 60,
                    onPressed:  (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                    },
                    shape: RoundedRectangleBorder(
                        side:BorderSide(
                            color: Colors.black
                        ),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                          fontSize: 50
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}