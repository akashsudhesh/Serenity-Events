// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

//void main() => runApp(HomePageWidget());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        home: Home() //create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}

//create new class for "home" property of MaterialApp()
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          //MediaQuery methods in use
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
        )
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({ Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xF3656C71),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'serenity',
              style: new TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Colors.white70,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                                Text(
                                    'Chats',
                                    style: new TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pinkAccent
                                    )
                                )
                          ],
                        ),

                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Container(
                                width: 60,
                                height: 60,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  'https://picsum.photos/seed/635/600',
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  ListTile(
                                    title: Text(
                                        'Lorem ipsum dolor...',
                                        style: new TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black
                                        )
                                    ),
                                    subtitle: Text(
                                        'Lorem ipsum dolor...',
                                        style: new TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black
                                        )
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFF303030),
                                      size: 20,
                                    ),
                                    tileColor: Color(0xFFF5F5F5),
                                    dense: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/635/600',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    ListTile(
                                      title: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          )
                                      ),
                                      subtitle: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black
                                          )
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 20,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/635/600',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    ListTile(
                                      title: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          )
                                      ),
                                      subtitle: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black
                                          )
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 20,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/635/600',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    ListTile(
                                      title: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          )
                                      ),
                                      subtitle: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black
                                          )
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 20,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/635/600',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    ListTile(
                                      title: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          )
                                      ),
                                      subtitle: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black
                                          )
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 20,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/635/600',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    ListTile(
                                      title: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          )
                                      ),
                                      subtitle: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black
                                          )
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 20,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/635/600',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    ListTile(
                                      title: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          )
                                      ),
                                      subtitle: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black
                                          )
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 20,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/635/600',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    ListTile(
                                      title: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          )
                                      ),
                                      subtitle: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black
                                          )
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 20,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/635/600',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    ListTile(
                                      title: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          )
                                      ),
                                      subtitle: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black
                                          )
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 20,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://picsum.photos/seed/635/600',
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    ListTile(
                                      title: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          )
                                      ),
                                      subtitle: Text(
                                          'Lorem ipsum dolor...',
                                          style: new TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black
                                          )
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 20,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      dense: false,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        //   child: Row(
                        //     mainAxisSize: MainAxisSize.max,
                        //     children: [
                        //       Padding(
                        //         padding:
                        //         EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        //         child: Container(
                        //           width: 60,
                        //           height: 60,
                        //           clipBehavior: Clip.antiAlias,
                        //           decoration: BoxDecoration(
                        //             shape: BoxShape.circle,
                        //           ),
                        //           child: Image.network(
                        //             'https://picsum.photos/seed/635/600',
                        //           ),
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: ListView(
                        //           padding: EdgeInsets.zero,
                        //           shrinkWrap: true,
                        //           scrollDirection: Axis.vertical,
                        //           children: [
                        //             ListTile(
                        //               title: Text(
                        //                 'Lorem ipsum dolor...',
                        //                   style: new TextStyle(
                        //                       fontSize: 20,
                        //                       fontWeight: FontWeight.bold,
                        //                       color: Colors.black
                        //                   )
                        //               ),
                        //               subtitle: Text(
                        //                 'Lorem ipsum dolor...',
                        //                   style: new TextStyle(
                        //                       fontSize: 13,
                        //                       fontWeight: FontWeight.normal,
                        //                       color: Colors.black
                        //                   )
                        //               ),
                        //               trailing: Icon(
                        //                 Icons.arrow_forward_ios,
                        //                 color: Color(0xFF303030),
                        //                 size: 20,
                        //               ),
                        //               tileColor: Color(0xFFF5F5F5),
                        //               dense: false,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
