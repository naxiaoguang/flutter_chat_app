import 'package:chat_app/main.dart';
import 'package:chat_app/pages/auth/login_page.dart';
import 'package:chat_app/pages/home/home_navigator.dart';
import 'package:chat_app/utils/io_system.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    String _uuid = storageHelper.getUUID();
    Future.delayed(Duration(seconds: 2), () {
      if (_uuid == '' || _uuid == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        ioSystem.connectSocket(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeNavigator()));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
      ),
    );
  }
}
