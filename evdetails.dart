import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:untitled/layout/interested.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/location.dart';
// void main() => runApp(evdetails());

class evdetails extends StatefulWidget {
  const evdetails({Key? key}) : super(key: key);
  static var
  eid="";
  @override
  State<evdetails> createState() => _evdetailsState();
}


class _evdetailsState extends State<evdetails> {
  late List data;
  var len=0;
  void viw() async {
    // var resp = await  get(login.url+"/events/flutterview/");

     var url = Uri.parse(login.url+"/events/moredetails/");
     Response resp = await post(url,body: { "eid": evdetails.eid });
    setState(() {
      data = jsonDecode(resp.body);
      len=data.length;
      print(data);
    });
  }

  @override
  void initState() {
    viw();
  }
  @override
  Widget build(BuildContext context) {
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
        // child: Center(
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [
                // Container(
                //   child: Text("MORE DETAILS:",style: new TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.pinkAccent
                //   ),),
                // ),
                // Container(
                  child: new ListView.builder(
                    itemCount: len,
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
                              Text('EVENTNAME: '+ data[index]['event_name'].toString()),
                            ],
                          ),
                          new SizedBox(
                            height: 20,
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('REMARKS: '+ data[index]['remark'].toString()),
                            ],
                          ),
                          new SizedBox(
                            height: 20,
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('PLACE: '+ data[index]['place'].toString()),
                            ],
                          ),
                          new SizedBox(
                            height: 20,
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('TIME: '+ data[index]['time'].toString()),
                            ],
                          ),
                          new SizedBox(
                            height: 20,
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('DATE: '+ data[index]['date'].toString()),
                            ],
                          ),
                          new SizedBox(
                            height: 20,
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('CONTACT: '+ data[index]['contact_no'].toString()),
                            ],
                          ),
                          new SizedBox(
                            height: 20,
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('FEE: '+ data[index]['entry_fee'].toString()),
                            ],
                          ),
                              // Container(
                              //     padding: EdgeInsets.fromLTRB(115, 0, 0, 20),
                              //     child:ElevatedButton.icon
                              //       (onPressed: (){
                              //       MyApp.eid=data[index]['e_id'].toString();
                              //       MyApp.la=double.parse(data[index]['latitude']);
                              //       MyApp.lo=double.parse(data[index]['longitude']);
                              //       Navigator.of(context).push(MaterialPageRoute(
                              //           builder: (BuildContext context) => MyApp()));
                              //       // savedata();
                              //     },
                              //         icon: Icon(Icons.location_pin,size: 18),
                              //         label:Text("Track")
                              //     )
                              // ),
                              Container(
                                  child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: ElevatedButton(
                                            onPressed: (){
                                              interested.iid=data[index]['e_id'].toString();
                                              Navigator.of(context).pop();
                                              Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (BuildContext context) => interested()));
                                              //
                                            },
                                            child: Text("VIEW WHO IS INTERESTED IN THIS",style: new TextStyle(fontWeight: FontWeight.bold)),

                                          ),
                                        )
                                      ] )
                              ),
                            ],
                          )
                        )
                        );
                      }
                  ),
                ),

              // ],
            // ),
          // ),
        // ),
      );

  }
}

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }
