import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/addpack.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/update_package.dart';
class yourpack extends StatefulWidget {
  const yourpack({Key? key}) : super(key: key);

  @override
  State<yourpack> createState() => _yourpackState();
}

class _yourpackState extends State<yourpack> {
  var len=0;
  late List data;
  void viw() async {

    var url = Uri.parse(login.url+"/packages/localviewpack/");
    Response resp = await post(url,body: { "eid": login.uid });
    setState(() {
      data = jsonDecode(resp.body);
      len=data.length;
      print(data);
    });
  }
  // void List_function() async {
  //   var url = Uri.parse(login.url+"/packages/pac/");                       //    packages/localviewpack/
  //   Response resp1 = await get(url);                                       //    post(url,body: { "paid": yourpack.paid });
  //
  //   this.setState(() {
  //
  //     data = jsonDecode(resp1.body);
  //     len=data.length;
  //   });
  //   // print(resp1.body);
  // }
  @override
  Widget build(BuildContext context) {
    // List_function();
    viw();
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
                  child: Text("YOUR PACKAGES",style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent
                  ),),
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
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
                                            child: Text("package:"+data[index]['package_details'].toString()),
                                            // child: Text("NAME"),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
                                            child: Text("price:"+data[index]['price'].toString()),
                                            // child: Text("NAME"),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(125, 0, 0, 20),
                                            child: ElevatedButton(
                                              onPressed: (){
                                                update_pack.p_id=data[index]['package_id'].toString();
                                                update_pack.name=data[index]['package_details'].toString();
                                                update_pack.price=data[index]['price'].toString();
                                                update_pack.act="upd";
                                                Navigator.of(context).pop();
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (BuildContext context) => update_pack()));
                                                //
                                              },
                                              child: Text("UPDATE"),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
                                            child: ElevatedButton(
                                              onPressed: (){
                                                update_pack.p_id=data[index]['package_id'].toString();
                                                update_pack.name=data[index]['package_details'].toString();
                                                update_pack.price=data[index]['price'].toString();
                                                update_pack.act="del";
                                                // update_servv.typ=data[index]['type'].toString();
                                                Navigator.of(context).push(MaterialPageRoute(
                                                    builder: (BuildContext context) => update_pack()));
                                                // add();
                                                //
                                                //
                                              },
                                              child: Text("DELETE"),
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
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => addpack()));
                      //
                    },
                    child: Text("ADD NEW"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
