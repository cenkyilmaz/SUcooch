import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register/singleSelect.dart';
import 'package:register/main.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _hasBeenPressed = false;

  List<String> lang = [
    "English",
    "Turkish"
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _hasBeenPressed ? Colors.black : Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
              color: _hasBeenPressed ? Colors.black : Colors.redAccent,
          ),
        ),
      ),
      body: Container(
        color: _hasBeenPressed ? Colors.black : Colors.white,
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: _hasBeenPressed ? Colors.white : Colors.black,),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.redAccent,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: _hasBeenPressed ? Colors.white : Colors.black),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Container(child:MaterialButton(
              minWidth: double.infinity,
              height: 45,
              onPressed: (openDialog),
              color: _hasBeenPressed ? Colors.grey : Colors.redAccent,
              child: Text("Language",style:TextStyle(color:Colors.white)),

            )),
            SizedBox(height: 10),



            SizedBox(height: 10),
            Container(child:MaterialButton(
              minWidth: double.infinity,
              height: 45,
              color: _hasBeenPressed ? Colors.grey : Colors.redAccent,
              // 3
              onPressed: (){},
              child: Text("Change Password",style:TextStyle(color:Colors.white)),

            )),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.redAccent,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "App",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: _hasBeenPressed ? Colors.white : Colors.black,),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            Container(child:MaterialButton(
              minWidth: double.infinity,
              height: 45,
              color: _hasBeenPressed ? Colors.grey : Colors.redAccent,
              // 3
              onPressed: () => {
                setState(() {
                  _hasBeenPressed = !_hasBeenPressed;
                })},
              child: Text("Night Mode",style:TextStyle(color:Colors.white)),

            )),
            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 50,
            ),
            Center(
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));},
                color: _hasBeenPressed ? Colors.black : Colors.white,
                child: Text("SIGN OUT",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: _hasBeenPressed ? Colors.white : Colors.black,)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
  void openDialog() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('List'),
            actions: <Widget>[Text('OK'), Text('Cancel')],
            content: Container(
                width: 300,
                height: 400,
                child: SingleSelectionExample(lang)),
          );
        });
    void changeColor(){
      HomePage.redd = Colors.black;
    }
}}