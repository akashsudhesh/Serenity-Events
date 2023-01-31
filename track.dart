import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


void main() => runApp(track());

class track extends StatefulWidget {
  const track({Key? key}) : super(key: key);

  @override
  State<track> createState() => _trackState();
}

class _trackState extends State<track> {

  // "lat":"11.2596128",
  // "lon":"75.785404",

  var url="http://maps.google.com/maps?&z=10&q=10.8298519+76.0205827&ll=10.8298519+76.0205827";

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
    );
  }
}
