import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage>{
  TextEditingController timeinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("TimePicker on TextField"),
          backgroundColor: Colors.redAccent, //background color of app bar
        ),
        body:Container(
            padding: EdgeInsets.all(15),
            height:150,
            child:Center(
                child:TextField(
                  controller: timeinput, //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(Icons.timer), //icon of text field
                      labelText: "Enter Time" //label text of field
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
                        timeinput.text = formattedTime; //set the value of text field.
                      });
                    }else{
                      print("Time is not selected");
                    }
                  },
                )
            )
        )
    );
  }
}