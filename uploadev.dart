import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/viewevents.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
// import 'dart:html' as html;
class uploadev extends StatefulWidget {
  const uploadev({Key? key}) : super(key: key);

  @override
  State<uploadev> createState() => _uploadevState();
}

class _uploadevState extends State<uploadev> {
  late TextEditingController evntnm,place,time,date,longitude,latitude,ent_fee,contact,remark;

  @override
  void initState() {
    evntnm=TextEditingController();
    place=TextEditingController();
    time=TextEditingController();
    date=TextEditingController();
    longitude=TextEditingController();
    latitude=TextEditingController();
    ent_fee=TextEditingController();
    contact=TextEditingController();
    remark=TextEditingController();
    // TODO: implement initState
    super.initState();
  }
  void postdata() async {
    String url = login.url+"/events/ev/";
    var resp = await post(url, body: {
      "event name": evntnm.text,
      "place": place.text,
      "time": time.text,
      "date": date.text,
      "longitude": longitude.text,
      "latitude": latitude.text,
      "entry fee": ent_fee.text,
      "contact": contact.text,
      "remark": remark.text
    });
  }
  checkTextFieldEmptyOrNot(){

    // Creating 3 String Variables.
    String text1,text2,text3,text4,text5,text6,text7,text8,text9 ;

    // Getting Value From Text Field and Store into String Variable
    text1 = evntnm.text ;
    text2 = place.text ;
    text3 = time.text ;
    text4 = date.text ;
    text5 = longitude.text ;
    text6 = latitude.text ;
    text7 = ent_fee.text ;
    text8 = contact.text ;
    text9 = remark.text ;
    // Checking all TextFields.
    if(text1 == '' || text2 == '' || text3 == ''||text4 == '' || text5 == '' || text6 == ''||text7 == '' || text8 == '' || text9 == '')
    {
      // Put your code here which you want to execute when Text Field is Empty.
      print('Text Field is empty, Please Fill All Data');
      showDialog(context: context, builder: (context) => AlertDialog(
        content: Text("Please Fill All Data in the textboxes"),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
      )
      );

    }else{

      // Put your code here, which you want to execute when Text Field is NOT Empty.
      postdata();
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => viewevents()));
      //
      showDialog(context: context, builder: (context) => AlertDialog(
        content: Text("your event will be verified soon"),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
      )
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    // final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return  Scaffold(
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
                  child: Text("UPLOAD EVENTS",style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent
                  ),),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: TextFormField(
                    controller: evntnm,
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
                    // height:150,
                    child:Center(
                        child:TextField(
                          controller: time, //editing controller of this TextField
                          decoration: InputDecoration(
                              icon: Icon(Icons.timer), //icon of text field
                              labelText: "Enter Time", //label text of field
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                          readOnly: true,  //set it true, so that user will not able to edit text
                          onTap: () async {
                            TimeOfDay? pickedTime =  await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            if(pickedTime != null ){
                              print(pickedTime.format(context));   //output 10:51 PM
                              DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                              //converting to DateTime so that we can further format on different pattern.
                              print(parsedTime); //output 1970-01-01 22:53:00.000
                              String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                              print(formattedTime); //output 14:59:00
                              //DateFormat() is from intl package, you can format the time on any pattern you need.

                              setState(() {
                                time.text = formattedTime; //set the value of text field.
                              });
                            }else{
                              print("Time is not selected");
                            }
                          },
                        )
                    )
                ),
                // Container(
                //   padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                //   child: TextFormField(
                //     controller: time,
                //     decoration: InputDecoration(
                //         labelText: "TIME(hh:mm:ss)",
                //         //hintText: "enter your full name",
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(20)
                //         )
                //     ),
                //   ),
                // ),
                Container(
                    // padding: EdgeInsets.all(15),
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                    // height: MediaQuery.of(context).size.width / 3,
                    child: Center(
                        child: TextField(
                          controller: date,
                          //editing controller of this TextField
                          decoration: InputDecoration(
                              icon: Icon(Icons.calendar_today), //icon of text field
                              labelText: "Enter Date", //label text of field
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
                                date.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                        ))),
                // Container(                                                 //older one
                //   padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                //   child: TextFormField(
                //     controller: date,
                //     decoration: InputDecoration(
                //         labelText: "DATE(yyyy-MM-dd)",
                //         //hintText: "enter your full name",
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(20)
                //         )
                //     ),
                //   ),
                // ),
                // Container(
                //   padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                //   child: DateTimeField(
                //
                //     format: formatter,
                //     controller: date,
                //     decoration: InputDecoration(
                //         labelText: "DATE(yyyy-MM-dd)",
                //         //hintText: "enter your full name",
                //         border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(20)
                //         )
                //     ),
                //     onShowPicker: (context, currentValue) async {
                //     final date = showDatePicker(context: context,initialDate: currentValue?? DateTime.now(),
                //         firstDate: DateTime(1990),lastDate: DateTime(2100));
                //     return date;
                //     },
                //
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: TextFormField(
                    controller: latitude,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^[1-9][\.\d]*(,\d+)?$')),
                    ],
                    decoration: InputDecoration(
                        labelText: "latitude of the event location",
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
                        labelText: "longitude of the event location",
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
                new SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: TextFormField(
                    controller: ent_fee,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        labelText: "ENTRY FEE(ENTER 0 IF NO FEE)",
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
                    controller: contact,
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
                    controller: remark,
                    decoration: InputDecoration(
                        labelText: "REMARKS",
                        //hintText: "enter your full name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: ElevatedButton(
                    onPressed: (){
                      checkTextFieldEmptyOrNot();
                      // postdata();
                      // Navigator.of(context).pop();
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) => viewevents()));
                      // //
                      // showDialog(context: context, builder: (context) => AlertDialog(
                      //   content: Text("your event will be verified soon"),
                      //   actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
                      // )
                      // );
                    },
                    child: Text("UPLOAD"),
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
