import 'package:flutter/material.dart';
import 'package:untitled/layout/publicuser.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart';
import 'package:untitled/layout/reqlocation.dart';

class killbordom extends StatefulWidget {
  const killbordom({Key? key}) : super(key: key);

  @override
  State<killbordom> createState() => _killbordomState();
  
}

class _killbordomState extends State<killbordom> {
  Position? _currentPosition;
  // @override
  // void initState() {
  //   super.initState();
  //   _getCurrentLocation();
  // }
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
        // width: 300,
        // height: 70,
        child:  Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                  ElevatedButton(onPressed:(){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => pubuser()));

                  },
                  child: Text('TAP TO KILL THE BOREDOM',style: TextStyle(fontSize: 20),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow,
                        onPrimary: Colors.blue,
                        padding: EdgeInsets.all(40.0)
                      )
                  ),


                ],

            ),
          ),

        )




      ),


    );
  }
  // getCurrentLocation() async {
  //   LocationPermission permission;
  //   permission = await Geolocator.checkPermission();
  //   permission = await Geolocator.requestPermission();
  //   Geolocator
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.best,
  //       forceAndroidLocationManager: true)
  //       .then((Position position) {
  //     setState(() {
  //       _currentPosition = position;
  //       // List_function();
  //     });
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }
}
