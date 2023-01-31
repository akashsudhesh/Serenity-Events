import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/addpack.dart';
import 'package:untitled/layout/serv_details.dart';
import 'package:untitled/layout/services.dart';
// import 'package:untitled/layout/public_user_draw.dart';
import 'package:untitled/layout/signup.dart';
import 'package:untitled/layout/viewevents.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);
  @override
  State<login> createState() => _loginState();
  static var url="http://192.168.214.206:8000/";
  static var uid="1";

}
// Future getApiData()async {
//   final response = await http.get(
//       'http://my_web_url/project_pinn/list_cat.php',
//       headers: {
//         "Accept": "application/json",
//         "Access-Control_Allow_Origin": "*"
//       });
//
//   print(response.statusCode);
//   print(response.body);
// }
class _loginState extends State<login> {
  late TextEditingController username,password;
  var data=[];
  bool _passwordVisible= false;
  @override
  void initState() {
    username=TextEditingController();
    password=TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  void postdata() async {
    var url= login.url+"login/log/";
    // String url = "http://192.168.1.47:8000/login/log/";
    Response resp = await post(url, body: {
      "username": username.text,
      "password": password.text,
    });

    data=jsonDecode(resp.body);
    if (data.length>0)
      {
        login.uid=data[0]['user_id'].toString();
        if(data[0]['type']=="user")
          {
            // Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => viewevents()));
            showDialog(context: context, builder: (context) => AlertDialog(
                content: Text("you have successfully logged in")));

          }
        else if(data[0]['type']=="bus")
          {
            // Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => services()));
            showDialog(context: context, builder: (context) => AlertDialog(
                content: Text("you have successfully logged in")));

          }
        else if(data[0]['type']=="local")
          {
            // Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => addpack()));
            showDialog(context: context, builder: (context) => AlertDialog(
                content: Text("you have successfully logged in")));
          }

      }
    else{  showDialog(context: context, builder: (context) => AlertDialog(
        content: Text("you are not either verified or created your account yet")));}

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black26,
        title: Text("serenity",style: new TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: Container(
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
                  child: Text("LOGIN",style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent
                  ),),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                        labelText: "USERNAME",
                        //hintText: "enter your full name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: password,
                      obscureText: !_passwordVisible,//This will obscure text dynamically
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        // Here is key idea
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    )
                ),
                // Container(
                //   padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                //   child: TextFormField(
                //     controller: password,
                //     decoration: InputDecoration(
                //         labelText: "PASSWORD",
                //         icon: const Padding(
                //           padding: const EdgeInsets.only(top: 15.0),
                //           child: const Icon(Icons.lock),
                //         ),
                //         //hintText: "enter your full name",
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(20)
                //         )
                //     ),
                //   ),
                // ),
                Container(
                  width: 300,
                  height: 70,
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: ElevatedButton(
                    onPressed: (){
                      postdata();

                      // actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
                      // )
                      // );
                    },
                    child: Text("LOGIN"),
                  ),
                ),
                Container(
                  width: 300,
                  height: 70,
                  padding: EdgeInsets.fromLTRB(50,10,50,10),


                  child:
                  ElevatedButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));


                  },
                    child: Text('Sign Up',style: new TextStyle(fontSize: 20)),),


                  // child: ElevatedButton(onPressed:(){  },
                  //   child: Text('sign in',style: new TextStyle(fontSize: 20)),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
