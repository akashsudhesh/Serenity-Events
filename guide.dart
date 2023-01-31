import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:fraudtrans/layouts/login.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/view_package_pub_user.dart';
// import 'package:untitled/layout/view_package_pub_user.dart';

class guide extends StatefulWidget {
  const guide({Key? key}) : super(key: key);

  @override
  State<guide> createState() => _guideState();
}

class _guideState extends State<guide> {
  late List data;
  void List_function() async {
    var url = Uri.parse(login.url+"/localguide/flutterview/");
    Response resp1 = await get(url);
    data = jsonDecode(resp1.body);
    this.setState(() {
    });
    print(resp1.body);
  }
  @override

  Widget build(BuildContext context) {
    List_function();
    return Scaffold(
      // drawer: draw(),
      appBar: AppBar(
        // backgroundColor: Colors.pinkAccent.shade200,
        title: Text(
          "Serenity",
          style: new TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ab.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            // itemCount: 2,
            itemBuilder: (context, index) {
              return new Padding(
                padding: new EdgeInsets.fromLTRB(20, 05, 10, 5),
                child: new Card(
                  elevation: 2.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(16.0)
                  ),
                  child: InkWell(
                    onTap: () {
                      print("tapped");
                      //  tap funtion here
                      List_function();
                    },
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.all(16.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new Text("name:"+" "+data[index]['name'].toString(),
                                // style: Theme
                                //   .of(context)
                                //   .textTheme
                                //   .titleMedium,
                              ),
                              new SizedBox(height: 6.0),

                              new Text(('place:' ).toUpperCase()+" "+data[index]['place'].toString(),
                                  // style: Theme
                                  // .of(context)
                                  // .textTheme
                                  // .titleMedium
                              ),

                              new SizedBox(height: 6.0),
                              new Text(('contact_no:' ).toUpperCase()+" "+data[index]['contact_no'].toString(),
                                  // style: Theme
                                  // .of(context)
                                  // .textTheme
                                  // .titleMedium
                              ),
                              new SizedBox(height: 6.0),
                              new Text(('photo:' ).toUpperCase()+" "+data[index]['photo'].toString(),
                                  // style: Theme
                                  // .of(context)
                                  // .textTheme
                                  // .titleMedium
                              ),
                              Container(
                                width: 300,
                                height: 70,
                                padding: EdgeInsets.fromLTRB(50,10,50,10),


                                child:
                                ElevatedButton(onPressed:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>viewpack()));


                                },
                                  child: Text('View packages',style: new TextStyle(fontSize: 20)),),


                                // child: ElevatedButton(onPressed:(){  },
                                //   child: Text('sign in',style: new TextStyle(fontSize: 20)),),
                              ),

                              // new SizedBox(height: 6.0),
                              // new Text(('email:' ).toUpperCase()+" "+data[index]['email'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium
                              // ),
                              // new SizedBox(height: 6.0),
                              // new Text(('specilization:' ).toUpperCase()+" "+data[index]['specilization'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium
                              // ),

                              // new SizedBox(height: 6.0),


                              // new SizedBox(height: 8.0),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
      ),

    );
  }
}
