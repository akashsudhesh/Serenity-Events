import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/evdetails.dart';
import 'package:untitled/layout/findguides.dart';
import 'package:untitled/layout/friends.dart';
import 'package:untitled/layout/publicuser.dart';
import 'package:untitled/layout/interested.dart';
import 'package:untitled/layout/msgrequests.dart';
import 'package:untitled/layout/requests.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/track.dart';
import 'package:untitled/layout/uploadev.dart';
import 'package:favorite_button/favorite_button.dart';
import 'view_services.dart';
import 'package:untitled/layout/location.dart';

class viewevents extends StatefulWidget {
  const viewevents({Key? key}) : super(key: key);
  static var eid="",uid="";
  static var latid="",lonid="";
  @override
  State<viewevents> createState() => _vieweventsState();
}

class _vieweventsState extends State<viewevents> {
  var len=0;
  late List data;
  late List data1;
  bool _isTap = false;
  void List_function() async {
    var url = Uri.parse(login.url+"events/flutterview/");
    Response resp1 = await post(url,body: { "lat": viewevents.latid,"lon": viewevents.lonid });


    this.setState(() {

      data = jsonDecode(resp1.body);
      len=data.length;
      print(data);
    });
    // print(resp1.body);
  }
  void add(eid) async{
    var url = Uri.parse(login.url+"eventstatus/es/");
    Response resp1 = await post(url,body: { "e_id": eid.toString(),"uid":login.uid.toString() });
  }
  // void delete(eid) async{
  //   var url = Uri.parse(login.url+"/eventstatus/deleteonuninterest/");
  //   Response resp1 = await post(url,body: { "e_id": eid.toString(),"uid":login.uid.toString() });
  // }

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
            // scrollDirection: Axis.horizontal,
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
                                // Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => findguides()));
                                //
                              },
                              child: Text("FIND GUIDES",style: new TextStyle(fontWeight: FontWeight.bold)),

                            ),
                          )
                          )] )
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
                                  // Navigator.of(context).pop();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) => requests()));
                                  //
                                },
                                child: Text("FRIEND REQUESTS",style: new TextStyle(fontWeight: FontWeight.bold)),

                              ),
                            )

                          )
                        ] )
                ),
                new SizedBox(
                  height: 5
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
                                // Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => friends()));
                                //
                              },
                              child: Text("YOUR FRIENDS",style: new TextStyle(fontWeight: FontWeight.bold)),

                            ),
                          )
                          )] )
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
                                    // Navigator.of(context).pop();
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => msgrequests()));
                                    //
                                  },
                                  child: Text("MESSAGES",style: new TextStyle(fontWeight: FontWeight.bold)),

                                ),
                              )
                          )] )
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
                                    // Navigator.of(context).pop();
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => view_services()));
                                    //
                                  },
                                  child: Text("VIEW SERVICES",style: new TextStyle(fontWeight: FontWeight.bold)),

                                ),
                              )
                          )] )
                ),
                 new SizedBox(
                  height: 40,
                 ),
                Container(
                    child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child:SizedBox(
                                height: 60,
                                width: 180,
                                child: ElevatedButton(
                                  onPressed: (){
                                    // Navigator.of(context).pop();
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => uploadev()));
                                    //
                                  },
                                  child: Text("UPLOAD EVENTS",style: new TextStyle(fontWeight: FontWeight.bold)),

                                ),
                              )
                          )] )
                ),
                new SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text("EVENTS IN YOUR AREA",style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                  ),),
                ),
                Container(
                  child: new ListView.builder(
                      //scrollDirection: Axis.horizontal,
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
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [

                                          Container(
                                            padding: EdgeInsets.fromLTRB(85, 0, 0, 20),
                                            child: ElevatedButton(
                                              onPressed: (){
                                                evdetails.eid=data[index]['e_id'].toString();
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (BuildContext context) => evdetails()));
                                                // add(data[index]['r_id'].toString());
                                              },
                                              child: Text(data[index]['event_name']),
                                            ),
                                          ),
                                          // Container(
                                          //   padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
                                          //   child: Text("DATE:"+data[index]['date'].toString()),
                                          //   // child: Text("DATE"),
                                          //   // child: Text("TIME"),
                                          // ),
                                          // Container(
                                          //   padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
                                          //   child: Text("TIME"+data[index]['time'].toString()),
                                          //   // child: Text("DATE"),
                                          //   // child: Text("TIME"),
                                          // ),
                                          // Container(
                                          //   padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
                                          //   child: Text("ENTRYFEE:"+data[index]['entry_fee'].toString()),
                                          //   // child: Text("DATE"),
                                          //   // child: Text("TIME"),
                                          // ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(115, 0, 0, 20),
                                            child:
                                            FavoriteButton(
                                              isFavorite: false,
                                              // iconColor: Colors.red,
                                              iconDisabledColor: Colors.grey,
                                              valueChanged: (_isFavourite) {
                                                 print('$_isFavourite)');
                                                 showDialog(context: context,
                                                           builder: (context) =>
                                                               AlertDialog(
                                                                   content: Text(
                                                                       "you are interested on this")));
                                                 add(data[index]['e_id'].toString());
                                              },
                                            ),

                                            // child: IconButton(
                                            //
                                            //   icon: Icon(Icons.favorite,
                                            //     color: _isTap?Colors.red:Colors.grey,
                                            //     size: 34.0,
                                            //     semanticLabel: 'Mark interest on this event',),
                                            //   onPressed: (){
                                            //     setState(() {
                                            //       _isTap =!_isTap;
                                            //
                                            //     });
                                            //     if(_isTap) {
                                            //       showDialog(context: context,
                                            //           builder: (context) =>
                                            //               AlertDialog(
                                            //                   content: Text(
                                            //                       "you are interested on this")));
                                            //       add(data[index]['e_id'].toString());
                                            //     }
                                            //     else
                                            //       {
                                            //         showDialog(context: context,
                                            //           builder: (context) =>
                                            //               AlertDialog(
                                            //                   content: Text(
                                            //                       "you are not interested")));
                                            //         // delete item on db
                                            //        // delete(data[index]['e_id'].toString());
                                            //       }
                                            //     // viewevents.eid=data[index]['e_id'].toString();
                                            //     // viewevents.uid=dat;
                                            //     //
                                            //
                                            //
                                            //   },
                                            //
                                            //
                                            //
                                            // ),
                                          ),
                                          Container(
                                              padding: EdgeInsets.fromLTRB(115, 0, 0, 20),
                                              child:ElevatedButton.icon
                                                (onPressed: (){
                                                MyApp.eid=data[index]['e_id'].toString();
                                                MyApp.la=double.parse(data[index]['latitude']);
                                                MyApp.lo=double.parse(data[index]['longitude']);
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (BuildContext context) => MyApp()));
                                                // savedata();
                                              },
                                                  icon: Icon(Icons.location_pin,size: 18),
                                                  label:Text("Track")
                                              )
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
    );
  }
}
