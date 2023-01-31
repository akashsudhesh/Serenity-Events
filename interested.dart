import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/moredetuser.dart';
import 'package:untitled/layout/inchat.dart';
class interested extends StatefulWidget {
  const interested({Key? key}) : super(key: key);
  static var iid="";
  static var uid="";
  static var uname="";
  @override
  State<interested> createState() => _interestedState();
}

class _interestedState extends State<interested> {
  var len=0;
  late List data;
  void List_function() async {
    // var url = Uri.parse(login.url+"eventstatus/eve_stat/");
    // Response resp1 = await get(url);
    var url = Uri.parse(login.url+"eventstatus/moredetails/");
    Response resp1 = await post(url,body: { "iid": interested.iid, "user_id": interested.uid.toString()});


    this.setState(() {

      data = jsonDecode(resp1.body);
      len=data.length;
    });
    // print(resp1.body);
  }
  void viw() async {
    var url = Uri.parse(login.url+"eventstatus/moredetails/");
    Response resp1 = await post(url,body: { "uname": interested.uname });
    this.setState(() {
      data = jsonDecode(resp1.body);
      len=data.length;
    });
    // print(resp1.body);
  }
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
            // scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Container(
                  child: Text("PEOPLE INTERESTED IN THIS EVENT",style: new TextStyle(
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    new SizedBox(
                                      height: 20,
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: new Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          // Container(
                                          //   padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                          //   child: CircleAvatar(),
                                          // ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(10, 0, 0, 20),
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(login.url+"static/"+data[index]['photo'].toString()),

                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(115, 0, 0, 20),
                                            child: Text(data[index]['user_name']),
                                            // child: Text("NAME"),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(115, 0, 0, 20),
                                            child: ElevatedButton(
                                              onPressed: (){
                                                // viw();
                                                more_detailsuser.uname=data[index]['user_name'].toString();
                                                // InchatWidget.uname=data[index]['user_name'].toString();

                                                Navigator.of(context).pop();
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (BuildContext context) => more_detailsuser()));
                                                //
                                              },
                                              child: Text("MORE DETAILS"),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                            )
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
