import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/paymentgateway.dart';

class pay extends StatefulWidget {
  const pay({Key? key}) : super(key: key);
  static var sid="";

  @override
  State<pay> createState() => _payState();
}

class _payState extends State<pay> {
  var amt="";
  void addto() async{
    var url = Uri.parse(login.url+"subscription/su1/");
    Response resp1 = await post(url,body: { "sid": pay.sid });
    var data=jsonDecode(resp1.body);
    this.setState(() {

      data = jsonDecode(resp1.body);
      if (data.length>0) {

        amt = data[0]['charge'].toString();
      }
      // len=data.length;
    });
    //



  }


  @override
  Widget build(BuildContext context) {
    addto();
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
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Container(
                  child: Text("MAKE YOUR SUBSCRIPTION",style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent
                  ),),
                ),
                Container(

                  child:
                  // new ListView.builder(
                  //     itemBuilder: (BuildContext,int context){
                  //  return new Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  //  child: new Card(
                  //    child: Column(
                  //      mainAxisAlignment: MainAxisAlignment.start,
                  //      children: <Widget>[
                  //        new SizedBox(
                  //          height: 20,
                  //        ),

                         new Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [

                             Text('YOU HAVE TO PAY '
                                  'RS'),
                             Text('\n'),
                             Text( amt, style: TextStyle(fontWeight: FontWeight.bold)),
                             Text('\n '),
                             Text(   'TO ACTIVATE '
                                 'MONTHLY SUBSCRIPTION'
                                 ' ON SERENITY'),
                           ],
                         ),


                //        ],
                //      ),
                //
                //    ),
                //    );
                // },
                //   )
                ),
                Container(
                  width: 300,
                  height: 70,
                  padding: EdgeInsets.fromLTRB(50,10,50,10),


                  child:
                  ElevatedButton(onPressed:(){
                    gateway.price=amt.toString();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>gateway()));


                  },
                    child: Text('Pay',style: new TextStyle(fontSize: 20)),),


                  // child: ElevatedButton(onPressed:(){  },
                  //   child: Text('sign in',style: new TextStyle(fontSize: 20)),),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
