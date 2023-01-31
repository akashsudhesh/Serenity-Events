import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class guide1 extends StatefulWidget {
  const guide1({Key? key}) : super(key: key);

  @override
  State<guide1> createState() => _guide1State();
}

class _guide1State extends State<guide1> {
  late List data;
  var len=0;
  void viw() async {
    Response resp = await get(
      "http://192.168.52.206:8000/localguide/flutterview/",
    );
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
        title: Text("Serenity",style: new TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/aa.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text("VIEW GUIDE",style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent
                  ),),
                ),
                Container(
                    child: new ListView.builder(
                        itemCount: len,
                        itemBuilder: (BuildContext context,int index) {
                          return new Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                                          // Text('photo: '+ data[index][''].toString()),
                                        ],
                                      ),
                                      new SizedBox(
                                        height: 20,
                                      ),
                                      new Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          // Text('name: '+ data[index]['name'].toString()),
                                        ],
                                      ),
                                      new SizedBox(
                                        height: 20,
                                      ),
                                      new Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          // Text('place: '+ data[index]['place'].toString()),
                                        ],
                                      ),
                                      new SizedBox(
                                        height: 20,
                                        ),
                                        new Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                        // Text('price : '+ data[index]['eventname'].toString()),
                                          ],
                                        ),
                                      new SizedBox(
                                        height: 20,
                                      ),
                                      new Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.phone),
                                          // Text(data[index]['contact_no '].toString())
                                          // Text(data)
                                        ],
                                      ),
                                    ],
                                  )
                              )
                          );
                        }
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
