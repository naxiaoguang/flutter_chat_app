import 'package:chat_app/main.dart';
import 'package:chat_app/pages/auth/login_page.dart';
import 'package:chat_app/pages/chats_page.dart';
import 'package:chat_app/utils/storage_helper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      String uuid = storageHelper.getUUID();
      if (uuid == '' || uuid == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChatsPage()));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 20, 20, 1),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SplashScreen',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            SizedBox(height: 12),
            CircularProgressIndicator(
              backgroundColor: Colors.white54,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
