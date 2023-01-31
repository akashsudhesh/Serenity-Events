import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/more_details_guide.dart';
class findguides extends StatefulWidget {
  const findguides({Key? key}) : super(key: key);
  static var latid="",lonid="";
  @override
  State<findguides> createState() => _findguidesState();
}

class _findguidesState extends State<findguides> {
  var len=0;
  late List data;
  void List_function() async {
    var url = Uri.parse(login.url+"localguide/locationview/");
    Response resp1 = await  post(url,body: { "lat": findguides.latid,"lon": findguides.lonid });

    this.setState(() {

      data = jsonDecode(resp1.body);
      len=data.length;
      print(data);
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
        child: Center(
          child: SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Container(
                  child: Text("GUIDES AROUND YOU",style: new TextStyle(
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
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(login.url+"static/"+data[index]['photo'].toString()),

                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(95, 0, 0, 20),
                                              child: Text(data[index]['name'].toString()),
                                             // child: Text("NAME"),
                                            ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(115, 0, 0, 20),
                                            child: ElevatedButton(
                                              onPressed: (){
                                                more_details.gid=data[index]['l_id'].toString();

                                                Navigator.of(context).pop();
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (BuildContext context) => more_details()));
                                                //
                                              },
                                              child: Text("MORE DETAILS"),
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

