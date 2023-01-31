import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/view_package_pub_user.dart';

class more_detailsserv extends StatefulWidget {
  const more_detailsserv({Key? key}) : super(key: key);
  static var bid="";
  // static var pid="";
  @override
  State<more_detailsserv> createState() => _more_detailsservState();
}

class _more_detailsservState extends State<more_detailsserv> {
  var len=0;
  late List data;
  // late List data1;
  void List_function() async {
    var url = Uri.parse(login.url+"/bususers/viewcompphone/");
    Response resp1 = await post(url,body: { "bid": more_detailsserv.bid });

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
                  child: Text("COMPANY DETAILS",style: new TextStyle(
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
                                          padding: EdgeInsets.all(16.0),
                                          child:
                                          Column(
                                            children: [


                                              Text("Company name:"+"\n"+data[index]['company_name'].toString()),
                                              new SizedBox(height: 20.0),

                                              Text("Contact:"+"\n"+data[index]['phone'].toString()),
                                              new SizedBox(height: 20.0),

                                              Text("Address:"+"\n"+data[index]['address'].toString()),
                                              new SizedBox(height: 20.0),
                                              //Text(data[index]['package_details'].toString()),



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
