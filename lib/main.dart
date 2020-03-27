import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/utils/io_system.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    messageStream.listen((res) {
      print('msg stream: $res');
    });
    activeUserStream.listen((res) {
      print('active user stream: $res');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
