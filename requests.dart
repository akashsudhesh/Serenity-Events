import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/friends.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/send_requests.dart';
class requests extends StatefulWidget {
  const
  requests({Key? key}) : super(key: key);

  @override
  State<requests> createState() => _requestsState();
}

class _requestsState extends State<requests> {
  var len=0;
  late List data;
  void List_function() async {

    var url = Uri.parse(login.url+"requests/requests/");
    Response resp1 = await post(url,body: {"uid": login.uid.toString()});


    this.setState(() {

      data = jsonDecode(resp1.body);
      len=data.length;
    });
    // print(resp1.body);
  }
  // void List_function() async {
  //   var url = Uri.parse(login.url+"/requests/requ/");
  //   Response resp1 = await get(url);
  //
  //   this.setState(() {
  //
  //     data = jsonDecode(resp1.body);
  //     len=data.length;
  //   });
  //   // print(resp1.body);
  //
  // }
  void add(usid) async{
    var url = Uri.parse(login.url+"/requests/requ/");
    Response resp1 = await post(url,body: {"reqid":usid});
  }
  void cancel(usid) async{
    var url = Uri.parse(login.url+"/requests/cancel/");
    Response resp1 = await post(url,body: {"reqid":usid});
  }
  @override
  Widget build(BuildContext context) {
    List_function();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black26,
        title: Text("serenity",style: new TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ab.jpg'),
                fit: BoxFit.cover,
              )
          ),
        child: SingleChildScrollView(
            child: Column(
                children: [
                  Container(
                      child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child:SizedBox(
                                height: 30,
                                width: 180,
                                  child: ElevatedButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) => friends()));
                                      //
                                      },
                                    child: Text("YOUR FRIENDS",style: new TextStyle(fontWeight: FontWeight.bold)),

                              ),
                            )
                            ) ] )
                  ),
                  new SizedBox(
                    height: 5,
                  ),
                  Container(
                      child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child:SizedBox(
                                height: 30,
                                width: 180,
                                child: ElevatedButton(
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) => send_req()));
                                  //
                                },
                                  child: Text("FIND FRIENDS",style: new TextStyle(fontWeight: FontWeight.bold)),

                              ),
                            )
                            ) ] )
                  ),
                  new SizedBox(
                    height: 40,
                  ),
        Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text("FRIEND REQUESTS",style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent
                  ),),
                ),
                new SizedBox(
                  height: 20,
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
                                    new Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(10, 0, 0, 20),
                                          child: CircleAvatar(),
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(75, 0, 0, 20),
                                          child:  Text(data[index]['fname'].toString()),
                                          // child: Text("NAME"),
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(85, 0, 0, 20),
                                          child: ElevatedButton(
                                            onPressed: (){
                                              add(data[index]['r_id'].toString());
                                            },
                                            child: Text("ACCEPT"),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(5, 0, 0, 20),
                                          child: ElevatedButton(
                                            onPressed: (){
                                              cancel(data[index]['r_id'].toString());
                                              //
                                            },
                                            child: Text("CANCEL"),
                                          ),
                                        ),
                                      ],
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
        )]
            )
        )
      ),
    );
  }
}
