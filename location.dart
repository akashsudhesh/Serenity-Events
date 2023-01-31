import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:untitled/layout/login.dart';
//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static var eid="";
  // static double la=11.2588;
  // static double lo=75.7804;
  // static var la;
  static late double la;
  static late double lo;
  // static var lo;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;
  late List data;
  var len=0;

  static final LatLng _center = LatLng(MyApp.la,MyApp.lo);              //longitudes to the west are negative,latitudes to the south are negative
  final Set<Marker> _markers = {};
  LatLng _currentMapPosition = _center;

  // void viw() async {
  //   // var resp = await  get(login.url+"/events/flutterview/");
  //
  //   var url = Uri.parse(login.url+"/events/location/");
  //   Response resp = await post(url,body: {"eid": MyApp.eid });          //"la": MyApp.la, "lo": MyApp.lo
  //   setState(() {
  //     data = jsonDecode(resp.body);
  //     len=data.length;
  //     if (data.length>=0) {
  //       MyApp.la = data[0]['latitude'];
  //       MyApp.lo = data[0]['longitude'];
  //     }
  //     print(data);
  //   });
  // }
  // double? checkDouble(dynamic value) {
  //   if(value is double) return value;
  //   if(value is int) return value.toDouble();
  //   if(value is String) return double.tryParse(value);
  //   return null;
  // }


  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_currentMapPosition.toString()),
        position: _currentMapPosition,
        infoWindow: InfoWindow(
            title: 'Event Location',
           // snippet: 'Welcome to Poland'
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _currentMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    // viw();
    // checkDouble(MyApp.la);
    // checkDouble(MyApp.lo);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Event Location'),
          backgroundColor: Colors.green,
        ),
        body: Stack(
          children: <Widget>[
            // Container(
            //     child: new ListView.builder(
            // itemBuilder: (BuildContext context,int index){
            //   return new Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            //   child: new Card(child: new Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       MyApp.la = data[index]['latitude'],
            //       MyApp.lo = data[index]['longitude'],
            //     ],
            //   ),));
            // })),
            GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 30.0,
                ),
                markers: _markers,
                onCameraMove: _onCameraMove
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  onPressed: _onAddMarkerButtonPressed,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.map, size: 30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}