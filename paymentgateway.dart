import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/login.dart';
import 'package:untitled/layout/services.dart';
class gateway extends StatefulWidget {
  const gateway({Key? key}) : super(key: key);
  static var price;
  @override
  State<gateway> createState() => _gatewayState();
}

class _gatewayState extends State<gateway> {
  late TextEditingController card_number,cname,cvv,amount;

  @override
  void initState() {
    card_number=TextEditingController();
    cname=TextEditingController();
    cvv=TextEditingController();
    amount=TextEditingController();
    amount.text=gateway.price;
    // phone=TextEditingController();
    // photo=TextEditingController();
    // username=TextEditingController();
    // password=TextEditingController();
    // TODO: implement initState
    super.initState();
  }
  void postdata() async {
    String url = login.url + "payment/payment/";
    var resp = await post(url, body: {
      "card_number": card_number.text,
      "cardholder_name": cname.text,
      "cvv": cvv.text,
      "amount": amount.text,
      // "phone": phone.text,
      // "photo": photo.text,
      // "username": username.text,
      // "password": password.text,

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black26,
        title: Text("serenity",style: new TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/ab.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
          child: Column(
            children: [
              Container(
                child: Text("MAKE PAYMENT",style: new TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent
                ),),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: TextFormField(
                  controller: cname,
                  decoration: InputDecoration(
                      labelText: "CARDHOLDER NAME",
                      // hintText: "enter your full name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),

                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: TextFormField(
                  controller: card_number,
                  decoration: InputDecoration(
                      labelText: "CARD NUMBER",
                      // hintText: "enter your full name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),

                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: TextFormField(
                  controller: cvv,
                  decoration: InputDecoration(
                      labelText: "CVV",
                      // hintText: "enter your full name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),

                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: TextFormField(
                  readOnly: true,
                  controller: amount,
                  decoration: InputDecoration(
                      labelText: "AMOUNT",
                      // hintText: "enter your full name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),

                ),
              ),
              Container(
                width: 300,
                height: 70,
                padding: EdgeInsets.fromLTRB(50,10,50,10),


                child:
                ElevatedButton(onPressed:(){
                  postdata();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>services()));
                  showDialog(context: context, builder: (context) => AlertDialog(
                    content: Text("service added successfully "),
                    actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
                  )
                  );
                },
                  child: Text('Pay',style: new TextStyle(fontSize: 20)),),


                // child: ElevatedButton(onPressed:(){  },
                //   child: Text('sign in',style: new TextStyle(fontSize: 20)),),
              ),
              Container(
                width: 300,
                height: 70,
                padding: EdgeInsets.fromLTRB(50,10,50,10),


                child:
                ElevatedButton(onPressed:(){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>services()));

                },
                  child: Text('Go Back',style: new TextStyle(fontSize: 20)),),


                // child: ElevatedButton(onPressed:(){  },
                //   child: Text('sign in',style: new TextStyle(fontSize: 20)),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


