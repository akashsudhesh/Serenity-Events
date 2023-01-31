import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/yourpack.dart';
import 'package:untitled/layout/yourserv.dart';
// import 'package:untitled/layout/login.dart';
class update_servv extends StatefulWidget {
  const update_servv({Key? key}) : super(key: key);
  static var serv_id,details,fee,act;

  @override
  State<update_servv> createState() => _update_servvState();
}

class _update_servvState extends State<update_servv> {
  late TextEditingController service_details,fee;
  @override
  void initState() {
    service_details=TextEditingController();
    fee=TextEditingController();
    service_details.text=update_servv.details;
    fee.text=update_servv.fee;

    // TODO: implement initState
    super.initState();
  }

  void postdata() async {
    if(update_servv.act=="upd") {
      String url = login.url + "/services/update_serv/";
      var resp = await post(url, body: {
        "serv_id": update_servv.serv_id,
        "service_details": service_details.text,
        "fee": fee.text,
        "act": "update"
      });
    }
    else if (update_servv.act=="del")
      {
        String url = login.url + "/services/update_serv/";
        var resp = await post(url, body: {
          "serv_id": update_servv.serv_id,
          "service_details": service_details.text,
          "fee": fee.text,
          "act": "delete"
        });
      }
  }
  checkTextFieldEmptyOrNot(){

    // Creating 3 String Variables.
    String text1,text2;

    // Getting Value From Text Field and Store into String Variable
    text1 = service_details.text ;
    text2 = fee.text ;



    // Checking all TextFields.
    if(text1 == '' || text2 == '')
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
          builder: (BuildContext context) => yourserv()));
      //
      showDialog(context: context, builder: (context) => AlertDialog(
        content: Text("service successfully updated"),
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
          child: SingleChildScrollView(
              child: Column(
                  children: [
                    // Container(
                    //     child: Column(
                    //         children: [
                    //           Align(
                    //             alignment: Alignment.topRight,
                    //             child: ElevatedButton(
                    //               onPressed: (){
                    //                 Navigator.of(context).pop();
                    //                 Navigator.of(context).push(MaterialPageRoute(
                    //                     builder: (BuildContext context) => yourpack()));
                    //                 //
                    //               },
                    //               child: Text("MANAGE YOUR PACKAGES",style: new TextStyle(fontWeight: FontWeight.bold)),
                    //
                    //             ),
                    //           )
                    //         ] )
                    // ),
                    new SizedBox(
                      height: 40,
                    ),
                    Container(

                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                child: Text("UPDATE SERVICE",style: new TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pinkAccent
                                ),),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                                child: TextFormField(
                                  controller: service_details,
                                  decoration: InputDecoration(
                                      labelText: "ENTER SERVICE DETAILS",
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
                                  controller: fee,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      labelText: "ENTER FEE",
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
                                    //     builder: (BuildContext context) => yourserv()));
                                    // //
                                    // showDialog(context: context, builder: (context) => AlertDialog(
                                    //   content: Text("service successfully updated"),
                                    //   actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
                                    // )
                                    // );
                                    //
                                  },
                                  child: Text("SUBMIT"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ])
          ),
        ));
  }
}
