import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/inchat.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/view_package_pub_user.dart';

class more_detailsuser extends StatefulWidget {
  const more_detailsuser({Key? key}) : super(key: key);
  static var uname="";
  // static var pid="";
  @override
  State<more_detailsuser> createState() => _more_detailsuserState();
}

class _more_detailsuserState extends State<more_detailsuser> {
  var len=0;
  late List data;
  // late List data1;
  void List_function() async {
    var url = Uri.parse(login.url+"regusers/forchat/");
    Response resp1 = await post(url,body: { "uname": more_detailsuser.uname });

    this.setState(() {

      data = jsonDecode(resp1.body);
      len=data.length;
    });
    // print(resp1.body);
  }
  //samb
  // void Lis_function() async {
  //   var url = Uri.parse(login.url+"/packages/pac/");
  //   Response resp2 = await post(url,body: { "pid": more_details.pid });
  //  }
  //
  @override
  Widget build(BuildContext context) {
    List_function();

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
                  child: Text("USER",style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent
                  ),),
                ),
                Container(
                  child: new ListView.builder(
                      itemCount: len,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context,int index){
                        return new Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: new Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new SizedBox(
                                      height: 20,
                                    ),
                                    new Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(25, 0, 0, 20),
                                          child:
                                          Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.fromLTRB(10, 0, 0, 20),
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(login.url+"static/"+data[index]['photo'].toString()),

                                                ),
                                              ),
                                              Text("username:  "+data[index]['username'].toString()),
                                              new SizedBox(height: 6.0),
                                              Text("name:  "+data[index]['name'].toString()),
                                              new SizedBox(height: 6.0),
                                              Text("address:  "+data[index]['address'].toString()),
                                              new SizedBox(height: 6.0),

                                              //Text(data[index]['package_details'].toString()),
                                              Container(
                                                // padding: EdgeInsets.fromLTRB(115, 0, 0, 20),
                                                child: ElevatedButton(
                                                  onPressed: (){
                                                    InchatWidget.regid=data[index]['u_id'].toString();
                                                    InchatWidget.uname=data[index]['username'].toString();
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                        builder: (BuildContext context) => InchatWidget()));
                                                    //
                                                  },
                                                  child: Text("chat",style: new TextStyle(fontWeight: FontWeight.bold)),

                                                ),
                                              )


                                            ],
                                          ),


                                          // child: Text("NAME"),
                                        ),
                                        // Container(
                                        //   padding: EdgeInsets.fromLTRB(25, 0, 0, 20),
                                        //   child: Text(data[index]['type'].toString()),
                                        //   // child: Text("NAME"),
                                        // ),
                                        // Container(
                                        //   padding: EdgeInsets.fromLTRB(25, 0, 0, 20),
                                        //   child: Text(data[index]['fee'].toString()),
                                        //   // child: Text("NAME"),
                                        // ),
                                        // Container(
                                        //   padding: EdgeInsets.fromLTRB(175, 0, 0, 20),
                                        //   child: ElevatedButton(
                                        //     onPressed: (){
                                        //       //
                                        //     },
                                        //     child: Text("UPDATE"),
                                        //   ),
                                        // ),
                                        // Container(
                                        //   padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
                                        //   child: ElevatedButton(
                                        //     onPressed: (){
                                        //       //
                                        //     },
                                        //     child: Text("DELETE"),
                                        //   ),
                                        // )
                                      ],
                                    ),

                                  ],
                                )
                            )
                        );
                      }
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
