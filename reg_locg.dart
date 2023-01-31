import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/login.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
class locg extends StatefulWidget {
  const locg({Key? key}) : super(key: key);

  @override
  State<locg> createState() => _locgState();
}

class _locgState extends State<locg> {
  late TextEditingController name,place,dob,contact_no,longitude,latitude,photo,username,password;
  var fil,objfile;
  @override
  void initState() {
    name=TextEditingController();
    place=TextEditingController();
    dob=TextEditingController();
    contact_no=TextEditingController();
    photo=TextEditingController();
    longitude=TextEditingController();
    latitude=TextEditingController();
    username=TextEditingController();
    password=TextEditingController();
    // TODO: implement initState
    super.initState();
  }
  void postdata() async {
    String url = login.url+"/localguide/loc/";
    var resp = await post(url, body: {
      "name": name.text,
      "place": place.text,
      "dob": dob.text,
      "contact_no": contact_no.text,
      "photo": photo.text,
      "longitude": longitude.text,
      "latitude": latitude.text,
      "username": username.text,
      "password": password.text,

    });
    final request =  MultipartRequest("POST",Uri.parse(login.url+"regusers/upload/"));
    request.fields["id"] = "local";
    request.files.add(MultipartFile("file", objfile.readStream, objfile.size,filename: objfile.name));
    var resp1 = await request.send();
    final respStr = await resp1.stream.bytesToString();

  }
  file_up() async {
    print('added successfully');
    var result = await FilePicker.platform.pickFiles(withReadStream: true);
    if (result != null) {
      // var fil=result.files.single.path;
      setState(() {
        fil= result.files.first.name;
        objfile = result.files.single;
        photo.text=fil;
      });
    } else {
      // User canceled the picker
    }
  }
  checkTextFieldEmptyOrNot(){

    // Creating 3 String Variables.
    String text1,text2,text3,text4,text5,text6,text7,text8,text9;

    // Getting Value From Text Field and Store into String Variable
    text1 = name.text ;
    text2 = place.text ;
    text3 = dob.text ;
    text4 = contact_no.text ;
    text5 = photo.text ;
    text6 = username.text ;
    text7 = password.text ;
    text8 = latitude.text;
    text9 = longitude.text;

    // Checking all TextFields.
    if(text1 == '' || text2 == '' || text3 == ''||text4 == '' || text5 == '' || text6 == ''||text7 == ''|| text8 == ''||text9 == '')
    {
      // Put your code here which you want to execute when Text Field is Empty.
      print('Text Field is empty, Please Fill All Data');
      showDialog(context: context, builder: (context) => AlertDialog(
        content: Text("Please Fill All Data in the textboxes"),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
      )
      );

    }else{

      postdata();
      //
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => login()));
      //
      showDialog(context: context, builder: (context) => AlertDialog(
        content: Text("successfully submitted."
            "you can now log in"),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
      )
      );
    }

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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text("REGISTER YOUR LOCAL GUIDE ACCOUNT HERE",style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent
                  ),),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      labelText: "NAME",
                      //hintText: "enter your full name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: TextFormField(
                    controller: place,
                    decoration: InputDecoration(
                        labelText: "PLACE",
                        //hintText: "enter your full name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: TextFormField(
                    controller: latitude,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^[1-9][\.\d]*(,\d+)?$')),
                    ],
                    decoration: InputDecoration(
                        labelText: "latitude of the your location",
                        //hintText: "enter your full name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: TextFormField(
                    controller: longitude,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^[1-9][\.\d]*(,\d+)?$')),
                    ],
                    decoration: InputDecoration(
                        labelText: "longitude of the your location",
                        //hintText: "enter your full name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                ),

                Container(
                    child:Center(
                      child: ElevatedButton(
                        child: Text("Select location to get Lat and Long"),
                        onPressed: () async {
                          final url = 'https://www.latlong.net/convert-address-to-lat-long.html';
                          if (await canLaunch(url)){
                            await launch(
                              url,
                              forceSafariVC: true,
                              forceWebView: true,
                              enableJavaScript: true,
                            );
                          }
                        },
                      ),
                    )
                ),
                Container(
                  // padding: EdgeInsets.all(15),
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                    // height: MediaQuery.of(context).size.width / 3,
                    child: Center(
                        child: TextField(
                          controller: dob,
                          //editing controller of this TextField
                          decoration: InputDecoration(
                              icon: Icon(Icons.calendar_today), //icon of text field
                              labelText: "Enter DOB", //label text of field
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              setState(() {
                                dob.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                        ))),
                // Container(
                //   padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                //   child: TextFormField(
                //     controller: dob,
                //     decoration: InputDecoration(
                //         labelText: "DATE OF BIRTH(yyyy-MM-dd)",
                //         //hintText: "enter your full name",
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(20)
                //         )
                //     ),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: TextFormField(
                    controller: contact_no,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    decoration: InputDecoration(
                        labelText: "CONTACT NO",
                        //hintText: "enter your full name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: TextFormField(
                    controller: username,
                    inputFormatters: [new  WhitelistingTextInputFormatter(RegExp("[a-zA-Z0-9_]")),],   //[a-zA-Z0-9_]
                    decoration: InputDecoration(
                        labelText: "SET A USER NAME(min 6 charecters)",
                        //hintText: "enter your full name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        labelText: "SET A PASSWORD",
                        //hintText: "enter your full name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 1.0),
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 5.0,
                    onPressed: () {
                      file_up();
                    },
                    padding: EdgeInsets.all(15.15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomRight:Radius.circular(10) , topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                      //borderRadius: BorderRadius.only()
                    ),
                    color: Colors.white,
                    child: Text(
                      'pick one photo as your profile pic ',
                      style: TextStyle(
                        color: Color(0xFF072850),
                        letterSpacing: 1.5,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: ElevatedButton(
                    onPressed: (){
                      checkTextFieldEmptyOrNot();
                      // postdata();
                      // //
                      // Navigator.of(context).pop();
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) => login()));
                      // //
                      // showDialog(context: context, builder: (context) => AlertDialog(
                      //   content: Text("successfully submitted."
                      //       "you can now log in"),
                      //   actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
                      // )
                      // );
                    },
                    child: Text("SUBMIT"),
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
