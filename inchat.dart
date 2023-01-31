//import '../flutter_flow/flutter_flow_icon_button.dart';
//import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
//import 'package:easy_debounce/easy_debounce.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/layout/login.dart';
//import 'package:google_fonts/google_fonts.dart';

class InchatWidget extends StatefulWidget {
  const InchatWidget({Key? key}) : super(key: key);
  static var regid="";
  static var uname="";

  @override
  _InchatWidgetState createState() => _InchatWidgetState();
}

class _InchatWidgetState extends State<InchatWidget> {
  // TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController mesg;

  @override
  void initState() {
    mesg=TextEditingController();
    super.initState();
  }

  var len=0;
  late List data;
  void List_function() async {
    var url = Uri.parse(login.url+"chat/chatt/");
    Response resp1 = await post(url,body: { "regid": InchatWidget.regid ,"message":mesg.text,"uid":login.uid });

    // this.setState(() {
    //
    //   data = jsonDecode(resp1.body);
    //   len=data.length;
    // });
    print(resp1.body);
  }
  void msg() async {
    var url = Uri.parse(login.url+"/chat/msg/");
    Response resp1 = await post(url,body: { "frm_id": InchatWidget.regid ,"to_id":login.uid });

    this.setState(() {

      data = jsonDecode(resp1.body);
      len=data.length;
    });
    // print(resp1.body);
  }
  void addto(uid) async{
    var url = Uri.parse(login.url+"regusers/msgreq/");
    Response resp1 = await post(url,body: { "lo_id": login.uid ,"uid":uid });

  }
  void List_function1() async {
    var url = Uri.parse(login.url+"chat/frominterested/");
    Response resp1 = await post(url,body: { "regid": InchatWidget.regid ,"message":mesg.text,"uid":login.uid });

    // this.setState(() {
    //
    //   data = jsonDecode(resp1.body);
    //   len=data.length;
    // });
    print(resp1.body);
  }
  @override
  Widget build(BuildContext context) {
    msg();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF656C71),
        automaticallyImplyLeading: false,
        title: Text(
          'serenity',
          style: new TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Colors.white70,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/ab.jpg'),
              fit: BoxFit.cover,
            )
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Stack(
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0xFFF5F5F5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.all(8.0),
                                        child: Text(
                                          InchatWidget.uname,
                                          textAlign: TextAlign.center,
                                          style: new TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFFFF0000),
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFFFEE58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                              child: TextFormField(
                                controller: mesg,
                                // onChanged: (_) => EasyDebounce.debounce(
                                //   'textController',
                                //   Duration(milliseconds: 2000),
                                //       () => setState(() {}),
                                // ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: '  Type something here',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                // style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              IconButton(
                                color: Colors.transparent,
                                // shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(18.0)),

                                // borderRadius: 30,
                                // borderWidth: 1,
                                iconSize: 40,
                                // buttonSize: 60,
                                icon: Icon(
                                  Icons.send,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () {
                                  addto(InchatWidget.regid.toString());
                                  List_function();
                                  List_function1();
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: new ListView.builder(
                        itemCount: len,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context,int index){
                          return new Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: new Card(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      new SizedBox(
                                        height: 5,
                                      ),
                                      new Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          // if (login.uid==data[index]['to_id'])

                                          Container(
                                            padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
                                            child: Text(data[index]['message'].toString()),
                                            // child: Text("DATE"),
                                            // child: Text("TIME"),
                                          ),

                                        ],
                                      ),

                                    ],
                                  )
                              )
                          );
                        }
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
