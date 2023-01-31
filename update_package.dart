import 'package:flutter/material.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/yourpack.dart';
import 'package:flutter/services.dart';
// import 'package:untitled/layout/login.dart';
class update_pack extends StatefulWidget {
  const update_pack({Key? key}) : super(key: key);
  static var p_id,name,price,act;

  @override
  State<update_pack> createState() => _update_packState();
}

class _update_packState extends State<update_pack> {
  late TextEditingController package_details,price;
  @override
  void initState() {
    package_details=TextEditingController();
    price=TextEditingController();
    package_details.text=update_pack.name;
    price.text=update_pack.price;

    // TODO: implement initState
    super.initState();
  }

  void postdata() async {
    if (update_pack.act=="upd") {
      String url = login.url + "/packages/update/";
      var resp = await post(url, body: {
        "p_id": update_pack.p_id,
        "package_details": package_details.text,
        "price": price.text,
        "act": "update"
      });
    }
    else if (update_pack.act=="del")
    {
      String url = login.url + "/packages/update/";
      var resp = await post(url, body: {
        "p_id": update_pack.p_id,
        "package_details": package_details.text,
        "price": price.text,
        "act": "delete"
      });
    }
  }
  checkTextFieldEmptyOrNot(){

    // Creating 3 String Variables.
    String text1,text2;

    // Getting Value From Text Field and Store into String Variable
    text1 = package_details.text ;
    text2 = price.text ;



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
          builder: (BuildContext context) => yourpack()));
      //
      showDialog(context: context, builder: (context) => AlertDialog(
        content: Text("package successfully updated"),
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
                                child: Text("UPDATE PACKAGE",style: new TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pinkAccent
                                ),),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                                child: TextFormField(
                                  controller: package_details,
                                  decoration: InputDecoration(
                                      labelText: "ENTER PACKAGE DETAILS",
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
                                  controller: price,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                      labelText: "ENTER HOW MUCH YOU CHARGE FOR THIS",
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
                                    //     builder: (BuildContext context) => yourpack()));
                                    // //
                                    // showDialog(context: context, builder: (context) => AlertDialog(
                                    //   content: Text("package successfully updated"),
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
