import 'package:flutter/material.dart';
import 'package:untitled/layout/yourserv.dart';
import 'package:untitled/layout/serv_details.dart';
class services extends StatefulWidget {
  const services({Key? key}) : super(key: key);

  @override
  State<services> createState() => _servicesState();
}

class _servicesState extends State<services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black26,
        title: Text("serenity",style: new TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: SizedBox.expand( child:new Stack(
        children: <Widget>[
        new Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ab.jpg'),
                fit: BoxFit.cover,
              )
          ),

            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Text("SERVICES",style: new TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent
                    ),),
                  ),
                  new SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                      child: Column(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child:SizedBox(
                                  height: 50,
                                  width: 180,
                                  child: ElevatedButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) => yourserv()));
                                      //
                                    },
                                    child: Text("YOUR SERVICES",style: new TextStyle(fontWeight: FontWeight.bold)),

                                  ),
                                )
                            ) ] )
                    ),
                  new SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: Column(
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child:SizedBox(
                                  height: 50,
                                  width: 180,
                                  child: ElevatedButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (BuildContext context) => serv_details()));
                                      //
                                    },
                                    child: Text("ADD SERVICES",style: new TextStyle(fontWeight: FontWeight.bold)),

                                  ),
                                )
                            ) ] )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      )
    );
  }
}
