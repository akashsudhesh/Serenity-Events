import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/reg_reguser.dart';


class send_req extends StatefulWidget {
  const send_req({Key? key}) : super(key: key);
  static var lo_id="",uid;

  @override
  State<send_req> createState() => _send_reqState();
}

class _send_reqState extends State<send_req> {

  var len=0;
  late List data;

  void List_function() async {
    var url = Uri.parse(login.url+"regusers/request/");
    Response resp1 = await post(url,body: { "uid":login.uid.toString() });

    this.setState(() {

      data = jsonDecode(resp1.body);
      len=data.length;
    });
    // void Addto() async{
    //   var url = Uri.parse(login.url+"/regusers/sndreq/");
    //   Response resp1 = await post(url,body: { "lo_id": send_req.lo_id ,"uid":send_req.uid });
    // }
    // print(resp1.body);
  }
  void addto(uid) async{
    var url = Uri.parse(login.url+"regusers/sndreq/");
      Response resp1 = await post(url,body: { "lo_id": login.uid ,"uid":uid });

  }
  @override
  Widget build(BuildContext context) {
    // addto();
    List_function();
    return Scaffold(
        appBar: AppBar(
          title: Text("SERENITY"),
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/ab.jpg'),
                  fit: BoxFit.cover,
                )
            ),
        child: new ListView.builder(
    // itemCount: data == null ? 0 : data.length,
    itemCount: len,
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
    // List_function();
    },
    child: new Column(
    children: <Widget>[
    new Padding(
    padding: new EdgeInsets.all(16.0),
    child: new Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    new Text("Username:"+" "+data[index]['name'].toString(),
      // style: Theme
      //   .of(context)
      //   .textTheme
      //   .titleMedium,
    ),
    new SizedBox(height: 6.0),
      Container(
        // width: 90,
        padding: EdgeInsets.fromLTRB(90, 10, 90, 0),
        child: ElevatedButton
          (onPressed: () {
            addto(data[index]['u_id'].toString());
            showDialog(context: context, builder: (context) => AlertDialog(
                content: Text("Request sent successfully")));
            setState(() {
              data.removeAt(index);

            });


          // addto();
          // request_service.fsid=data[index]['mech_id'].toString();
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>request_service()));


        },
          child: Text("Send Request"),

        ),
      )
    // new Text(('rating:' ).toUpperCase()+" ", style: Theme
    //     .of(context)
    //     .textTheme
    //     .titleMedium
    // ),

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
    ),);
  }


}
