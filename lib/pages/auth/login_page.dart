import 'dart:convert';
import 'dart:math';
import 'package:chat_app/main.dart';
import 'package:chat_app/pages/home/home_navigator.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _passwordCtrl = TextEditingController();
  TextEditingController _mailCtrl = TextEditingController();

  @override
  void initState() {
    storageHelper.removeUUID();
    ioSystem.disconnectSocket();
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 64,
                width: 64,
                child: Placeholder(),
              ),
              SizedBox(
                height: 48,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _mailCtrl,
                      cursorColor: Colors.white70,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Username',
                        hintStyle: TextStyle(color: Colors.white70),
                        contentPadding: EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
                        filled: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.person,
                            color: Colors.white70,
                          ),
                        ),
                        fillColor: Color.fromRGBO(30, 30, 30, 1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(48),
                          borderSide: BorderSide(width: 0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(48),
                          borderSide: BorderSide(width: 0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _passwordCtrl,
                      cursorColor: Colors.white70,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white70),
                        contentPadding: EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
                        filled: true,
                        suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.lock,
                              color: Colors.white70,
                            )),
                        fillColor: Color.fromRGBO(30, 30, 30, 1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(48),
                          borderSide: BorderSide(width: 0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(48),
                          borderSide: BorderSide(width: 0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Material(
                color: Color.fromRGBO(66, 66, 66, 1),
                borderRadius: BorderRadius.circular(32),
                child: InkWell(
                  onTap: () async {
                    /* String uuid = '62dba345f9241ba';
                    storageHelper.setUUID = uuid;

                    ioSystem.connectSocket();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeNavigator(),
                      ),
                    ); */
                    await doLogin();
                  },
                  borderRadius: BorderRadius.circular(32),
                  child: Container(
                    height: 54,
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    width: double.infinity,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.ac_unit,
                            color: Colors.transparent,
                          ),
                          Text(
                            'Login',
                            style: TextStyle(fontSize: 16, color: Colors.white70, fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_forward_ios, color: Colors.white70)
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> doLogin() async {
    try {
      await dio.post('/auth/login', data: {"email": _mailCtrl.text, "password": _passwordCtrl.text}).then((res) async {
        Map<String, dynamic> data = res.data is String ? jsonDecode(res.data) : res.data;
        print(data);
        if (data['status'] == 1) {
          print('a');
          await storageHelper.setToken(data['token']);
          ioSystem.connectSocket(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeNavigator(),
            ),
          );
        } else {
          print('b');
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
