import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/inchat.dart';
class friends extends StatefulWidget {
  const friends({Key? key}) : super(key: key);

  @override
  State<friends> createState() => _friendsState();
}

class _friendsState extends State<friends> {
  var len=0;
  late List data;
  int from=0;
  void List_function() async {

    var url = Uri.parse(login.url+"requests/frnds/");
    Response resp1 = await post(url,body: {"uid":login.uid.toString(),

    });

    this.setState(() {

      data = jsonDecode(resp1.body);
      len=data.length;
    });
    // print(resp1.body);
  }
  void rej(usid) async{
    var url = Uri.parse(login.url+"requests/rej/");
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
        child: Center(
          child: SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Container(
                  child: Text("YOUR FRIENDS",style: new TextStyle(
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
                                          Container(
                                            padding: EdgeInsets.fromLTRB(10, 0, 0, 20),
                                            child: CircleAvatar( backgroundImage: NetworkImage(login.url+"static/"+data[index]['photo'].toString()),),
                                          ),
                                          Container(

                                            padding: EdgeInsets.fromLTRB(75, 0, 0, 20),

                                            child: Text((data[index]['fname']).toString()),
                                            // child: Text("CONTACT"),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(85, 0, 0, 20),
                                            child: ElevatedButton(
                                              onPressed: (){

                                                InchatWidget.regid=data[index]['from_id'].toString();         //original
                                                InchatWidget.uname=data[index]['fname'].toString();

                                                Navigator.of(context).pop();
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (BuildContext context) => InchatWidget()));
                                                //
                                              },
                                              child: Text("CHAT"),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(5, 0, 0, 20),
                                            child: ElevatedButton(
                                              onPressed: (){
                                                rej(data[index]['r_id'].toString());
                                                //
                                              },
                                              child: Text("UNFRIEND"),
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
