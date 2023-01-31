import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/signup.dart';
import 'package:untitled/layout/view_services.dart';
import 'package:untitled/layout/viewevents.dart';
import 'package:untitled/layout/findguides.dart';

class pubuser extends StatefulWidget {
  const pubuser({Key? key}) : super(key: key);

  @override
  State<pubuser> createState() => _pubuserState();
}

class _pubuserState extends State<pubuser> {
  Position? _currentPosition;
  var len=0;
  late List data;
  void List_function() async {
    var url = Uri.parse(login.url+"events/pbuser/");
    Response resp1 = await get(url);

    this.setState(() {

      data = jsonDecode(resp1.body);
      len=data.length;
    });
    // print(resp1.body);
  }
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }
  @override
  Widget build(BuildContext context) {
    List_function();
    // viewevents.latid = _currentPosition!.latitude.toString();
    // viewevents.lonid = _currentPosition!.longitude.toString();
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
                                    findguides.latid = _currentPosition!.latitude.toString();
                                    findguides.lonid = _currentPosition!.longitude.toString();
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
                                        builder: (BuildContext context) => view_services()));
                                    //
                                  },
                                  child: Text("VIEW SERVICES",style: new TextStyle(fontWeight: FontWeight.bold)),

                                ),
                              )
                          )] )
                ),
                new SizedBox(
                  height: 20,
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
                                    if (_currentPosition != null){ Text(
                                        "LAT: ${_currentPosition!.latitude}, LNG: ${_currentPosition!
                                        .longitude}"
                                    );}
                                    Navigator.of(context).pop();
                                    // var lati = _currentPosition!.latitude.toString();
                                    // var long = _currentPosition!.longitude.toString();
                                    // _getCurrentLocation();
                                    // if (_currentPosition != null) {
                                    viewevents.latid = _currentPosition!.latitude.toString();
                                    viewevents.lonid = _currentPosition!.longitude.toString();
                                    findguides.latid = _currentPosition!.latitude.toString();
                                    findguides.lonid = _currentPosition!.longitude.toString();
                                    // viewevents.latid = _currentPosition!.latitude.toString();
                                    // viewevents.lonid = _currentPosition!.longitude.toString();
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => login()));
                                    //
                                  },
                                  child: Text("Login",style: new TextStyle(fontWeight: FontWeight.bold)),

                                ),
                              )

                          )
                        ] )
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
                                        builder: (BuildContext context) => signup()));
                                    //
                                  },
                                  child: Text("Sign up",style: new TextStyle(fontWeight: FontWeight.bold)),

                                ),
                              )

                          )
                        ] )
                ),
                new SizedBox(
                  height: 30,
                  width: 180,),
                Container(
                  child: Text("EVENTS IN YOUR AREA",style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
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
                                            padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
                                            child: Text("EVENT NAME:"+data[index]['event_name']),
                                            // child: Text("DATE"),
                                            // child: Text("TIME"),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
                                            child: Text("PLACE:"+data[index]['place']),
                                            // child: Text("DATE"),
                                            // child: Text("TIME"),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
                                            child: Text("TIME:"+data[index]['time']),
                                            // child: Text("DATE"),
                                            // child: Text("TIME"),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
                                            child: Text("DATE:"+data[index]['date']),
                                            // child: Text("DATE"),
                                            // child: Text("TIME"),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
                                            child: Text("CONTACT:"+data[index]['contact_no']),
                                            // child: Text("DATE"),
                                            // child: Text("TIME"),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(115, 0, 0, 20),
                                            child: ElevatedButton(
                                                onPressed: (){
                                                  showDialog(context: context, builder: (context) => AlertDialog(
                                                      content: Text("You must login")));
                                                  //
                                                },
                                                child: Icon(Icons.thumb_up_alt_outlined,
                                                  color: Colors.white70,
                                                  size: 34.0,
                                                  semanticLabel: 'Mark interest on this event',)
                                            ),
                                          ),
                                          // Container(
                                          //   width: 300,
                                          //   height: 70,
                                          //   padding: EdgeInsets.fromLTRB(50,10,50,10),
                                          //
                                          //
                                          //   child:
                                          //   ElevatedButton(onPressed:(){
                                          //     Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                                          //
                                          //
                                          //   },
                                          //     child: Text('LOGIN',style: new TextStyle(fontSize: 20)),),
                                          //
                                          //
                                          //   // child: ElevatedButton(onPressed:(){  },
                                          //   //   child: Text('sign in',style: new TextStyle(fontSize: 20)),),
                                          // ),
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
  _getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        // List_function();
      });
    }).catchError((e) {
      print(e);
    });
  }
}

