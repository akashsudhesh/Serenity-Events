import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/friends.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/inchat.dart';
import 'package:untitled/layout/send_requests.dart';
class msgrequests extends StatefulWidget {
  const
  msgrequests({Key? key}) : super(key: key);

  @override
  State<msgrequests> createState() => _msgrequestsState();
}

class _msgrequestsState extends State<msgrequests> {
  var len=0;
  late List data;
  void List_function() async {

    var url = Uri.parse(login.url+"msgrqst/msgrequests/");
    Response resp1 = await post(url,body: {"uid": login.uid.toString()});


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

                    new SizedBox(
                      height: 5,
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
                                child: Text("MESSAGES",style: new TextStyle(
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
                                                    child: new Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        // Container(
                                                        //   padding: EdgeInsets.fromLTRB(10, 0, 0, 20),
                                                        //   child: CircleAvatar(),
                                                        // ),
                                                        Container(
                                                          padding: EdgeInsets.fromLTRB(75, 0, 0, 20),
                                                          child:  Text(data[index]['fname'].toString()),
                                                          // child: Text("NAME"),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.fromLTRB(75, 0, 0, 20),
                                                          child:  Text(data[index]['time'].toString()),
                                                          // child: Text("NAME"),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.fromLTRB(85, 0, 0, 20),
                                                          child: ElevatedButton(
                                                            onPressed: (){
                                                              InchatWidget.regid=data[index]['from_id'].toString();
                                                              InchatWidget.uname=data[index]['fname'].toString();
                                                              Navigator.of(context).push(MaterialPageRoute(
                                                                  builder: (BuildContext context) => InchatWidget()));
                                                              //
                                                            },
                                                            child: Text("CHAT"),
                                                          ),
                                                        ),

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
                    )]
              )
          )
      ),
    );
  }
}
