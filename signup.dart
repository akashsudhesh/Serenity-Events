import 'package:flutter/material.dart';
import 'package:untitled/layout/reg_bususer.dart';
import 'package:untitled/layout/reg_locg.dart';
import 'package:untitled/layout/reg_reguser.dart';
// import 'package:onroad/layout/bystander_reg.dart';
// import 'package:onroad/layout/doct_reg.dart';
// import 'package:onroad/layout/login.dart';
// import 'package:onroad/layout/regmech.dart';
// import 'package:onroad/layout/user_reg.dart';
// import 'package:onroad/layout/patient_reg.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade600,
        title: Text(
          "SIGNUP !",
          style: new TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).pop();
            // Navigator.push(context, MaterialPageRoute(builder: (_) => login()));
          },
        ),
      ),
      body: Container(
        // child: Image.asset('assets\\ab.png'),

        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/ab.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => reguser()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown.shade600, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    child: Text("  USER REGISTER  "),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => bususer()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown.shade600, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    child: Text(" BUSINESS USER REGISTER"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => locg()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown.shade600, // background
                      onPrimary: Colors.white, // foreground
                    ),
                    child: Text("LOCAL GUIDE REGISTER"),
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