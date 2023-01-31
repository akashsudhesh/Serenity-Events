import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:fraudtrans/layouts/login.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/moredetservies.dart';

class view_services extends StatefulWidget {
  const view_services({Key? key}) : super(key: key);

  @override
  State<view_services> createState() => _view_servicesState();
}

class _view_servicesState extends State<view_services> {
  late List data;
  void List_function() async {
    var url = Uri.parse(login.url+"services/serv_view/");
    Response resp1 = await get(url);
    data = jsonDecode(resp1.body);
    this.setState(() {
    });
    print(resp1.body);
  }
  // @override
  // void initState() {
  //   super.initState();
  //   List_function();
  // }
  @override

  Widget build(BuildContext context) {
    List_function();
    return Scaffold(
      // drawer: draw(),
      appBar: AppBar(
        // backgroundColor: Colors.pinkAccent.shade200,
        title: Text(
          "VIEW SERVICES",
          style: new TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ab.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: new ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
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
                              // new Text("Service:"+" "+data[index]['type'].toString(),
                              //   // style: Theme
                              //   //   .of(context)
                              //   //   .textTheme
                              //   //   .titleMedium,
                              // ),
                              // new SizedBox(height: 6.0),

                              new Text("details:"+" "+data[index]['service_details'].toString(),
                                // style: Theme
                                //   .of(context)
                                //   .textTheme
                                //   .titleMedium,
                              ),
                              new SizedBox(height: 6.0),

                              new Text(('Fee:' ).toUpperCase()+" "+data[index]['fee'].toString(),
                                  // style: Theme
                                  // .of(context)
                                  // .textTheme
                                  // .titleMedium
                              ),
                              Container(
                              padding: EdgeInsets.all(16.0),
                              child: ElevatedButton(
                              onPressed: (){
                                more_detailsserv.bid=data[index]['b_id'].toString();
                               Navigator.of(context).push(MaterialPageRoute(
                                   builder: (BuildContext context) => more_detailsserv()));
                        // add(data[index]['r_id'].toString());
                               },
                                child: Text('more about the organization'),
                              ),
                              )
                              // new SizedBox(height: 6.0),
                              // new Text(('time:' ).toUpperCase()+" "+data[index]['time'].toString(), style: Theme
                              //     .of(context)
                              //     .textTheme
                              //     .titleMedium
                              // ),

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
