import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled/layout/publicuser.dart';
void main() => runApp(LocationPage());              //medium.com

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);
  @override
  State<LocationPage> createState() => _LocationPageState();

}

class _LocationPageState extends State<LocationPage> {
  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
        '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.black26,
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
                  ElevatedButton(
                    onPressed: _getCurrentPosition,
                    child: const Text("Get Current Location"),
                  )

                ],

              ),
            ),

          )




      ),

    );
  }
}