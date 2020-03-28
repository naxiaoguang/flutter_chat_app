import 'package:chat_app/pages/auth/splash_screen.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/utils/io_system.dart';
import 'package:chat_app/utils/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
StorageHelper storageHelper = StorageHelper();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  storageHelper.prefs = await SharedPreferences.getInstance();
  runApp(App());
}

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
      home: SplashScreen(),
    );
  }
}
