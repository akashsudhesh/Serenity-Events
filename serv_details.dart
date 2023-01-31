import 'dart:convert';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
// import 'package:untitled/layout/pa';
class serv_details extends StatefulWidget {
  const serv_details({Key? key}) : super(key: key);
  // static var sid="";
  @override
  State<serv_details> createState() => _serv_detailsState();
}

class _serv_detailsState extends State<serv_details> {
  List dropList =[
    {"s_id":0, "type": "<Select>"},
    // {"edpt_id":1, "name": "<two>"},
  ];
  var fkey=GlobalKey<FormState>();
  var val=true;
  var dropdownValue = "";
  // var holder;
  // var amt ="";
  // var x;

  late TextEditingController details,type,fee;
  var len=0;
  late List data;
  void gendrop() async {
    String url = login.url+"subscription/su/";
    var resp = await get(url);
    print(resp.body);
    setState(() {
      dropList = jsonDecode(resp.body);
    });
  }
    @override
  void initState() {
    details=TextEditingController();
    type=TextEditingController();
    fee=TextEditingController();
    // TODO: implement initState
    super.initState();
    gendrop();
  }

  void postdata() async {
    String url = login.url+"services/servi/";
    var resp = await post(url, body: {
      "service_details": details.text,
      "type":type.text,
      "fee": fee.text,
      "b_id": login.uid
    });
    Navigator.of(context).push(MaterialPageRoute(

        builder: (BuildContext context) => pay()));
  }

  // void getDropDownItem(){
  //
  //   setState(() {
  //     holder = dropdownValue ;
  //   });
  // }
  // void viw() async {
  //   var url = Uri.parse(login.url+"/subscription/dropdown/");
  //   Response resp1 = await get(url);
  //   this.setState(() {
  //     data = jsonDecode(resp1.body);
  //     len=data.length;
  //   });
  //   // print(resp1.body);
  // }
  checkTextFieldEmptyOrNot(){

    // Creating 3 String Variables.
    String text1,text2;

    // Getting Value From Text Field and Store into String Variable
    text1 = details.text ;
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

      // txt.text= holder;
      // Navigator.of(context).pop();
      pay.sid=dropdownValue;

    }

  }
  @override
  Widget build(BuildContext context) {
    // viw();
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
                  child: Text("ADD WHAT YOU WANT TO PROMOTE IN DETAIL",style: new TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent
                  ),),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: details,
                    decoration: InputDecoration(
                       // labelText: "NAME",
                        hintText: "DETAILS HERE PLEASE",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                    maxLines: 10,
                    minLines: 1,
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
                        labelText: "ENTER HOW MUCH YOU CHARGE FOR THIS",
                        //hintText: "enter your full name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                ),



                // items: dropList.entries.map((e) => e.key).toList(),
                // Container(
                //
                //   child: DropDownField(
                //     controller: type,
                //     hintText: "select the type",
                //     enabled: true,
                //     items: dropList.map((item) => DropdownMenuItem(child: Text(item['type'].toString()),value:item['s_id'].toString(),)).toList(),
                //     onValueChanged: (value){
                //       setState(() {
                //
                //         dropdownValue = value.toString();
                //             print(dropdownValue);
                //
                //               });
                //
                //     },
                //
                //   )
                // ),
                Container( //dropdown
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10), //3rd



                    width: 350.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)
                    ),

                    child: DropdownButtonFormField(
                        hint: Text("<select the service type>"),
                        onChanged: ( newValue) {
                          setState(() {
                            // serv_details.sid=dropdownValue;
                            // x=dropdownValue;
                            // getDropDownItem();
                            dropdownValue = newValue.toString();
                            print(dropdownValue);
                            // amt = data[holder]['type'].toString();
                          });
                        },
                        items: dropList.map((item) => DropdownMenuItem(child: Text(item['type'].toString()),value:item['s_id'].toString(),)).toList()
                    )

                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: ElevatedButton(
                    onPressed: (){
                      checkTextFieldEmptyOrNot();
                      // getDropDownItem();
                      // postdata();
                      //
                      // // txt.text= holder;
                      // // Navigator.of(context).pop();
                      // pay.sid=dropdownValue;


                      //
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
