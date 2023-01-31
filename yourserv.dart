import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/serv_details.dart';
import 'package:untitled/layout/update_servv.dart';
class yourserv extends StatefulWidget {
  const yourserv({Key? key}) : super(key: key);
  static var serv_id="";

  @override
  State<yourserv> createState() => _yourservState();
}

class _yourservState extends State<yourserv> {
  var len=0;
  late List data;
  void viw() async {

    var url = Uri.parse(login.url+"/services/busviewservices/");
    Response resp = await post(url,body: { "eid": login.uid });
    setState(() {
      data = jsonDecode(resp.body);
      len=data.length;
      print(data);
    });
  }
  // void List_function() async {
  //   var url = Uri.parse(login.url+"/services/servi/");
  //   Response resp1 = await get(url);
  //
  //   this.setState(() {
  //
  //     data = jsonDecode(resp1.body);
  //     len=data.length;
  //   });
  //   // print(resp1.body);
  // }
  void add() async{
    var url = Uri.parse(login.url+"/services/delete_serv/");
    Response resp1 = await post(url,body: { "serv_id": yourserv.serv_id.toString()});
  }

  @override
  Widget build(BuildContext context) {
    // List_function();
    viw();
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
                  child: Text("YOUR SERVICES",style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent
                  ),),
                ),
                Container(
                  child: new ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
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
                                      child: new Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(25, 0, 0, 20),
                                            child: Text("details    :"+ data[index]['service_details'].toString()),
                                            // child: Text("NAME"),
                                          ),
                                          // Container(
                                          //   padding: EdgeInsets.fromLTRB(25, 0, 0, 20),
                                          //   child: Text(data[index]['type'].toString()),
                                          //   // child: Text("NAME"),
                                          // ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(25, 0, 0, 20),
                                            child: Text("price    :"+ data[index]['fee'].toString()),
                                            // child: Text("NAME"),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(25, 0, 0, 20),
                                            child: Text("added date   :"+ data[index]['date'].toString()),
                                            // child: Text("NAME"),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(25, 0, 0, 20),
                                            child: Text("If your service is older than a month, it might not be visible for the users "),
                                            // child: Text("NAME"),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(25, 0, 0, 20),
                                            child: ElevatedButton(
                                              onPressed: (){
                                                update_servv.serv_id=data[index]['serv_id'].toString();
                                                update_servv.details=data[index]['service_details'].toString();
                                                update_servv.fee=data[index]['fee'].toString();
                                                update_servv.act="upd";
                                                // update_servv.typ=data[index]['type'].toString();
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (BuildContext context) => update_servv()));
                                                //
                                              },
                                              child: Text("UPDATE"),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(25, 0, 0, 20),
                                            child: ElevatedButton(
                                              onPressed: (){

                                                update_servv.serv_id=data[index]['serv_id'].toString();
                                                update_servv.details=data[index]['service_details'].toString();
                                                update_servv.fee=data[index]['fee'].toString();
                                                update_servv.act="del";
                                                // update_servv.typ=data[index]['type'].toString();
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (BuildContext context) => update_servv()));
                                                // add();
                                                //
                                              },
                                              child: Text("DELETE"),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
