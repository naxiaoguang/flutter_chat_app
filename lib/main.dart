import 'package:chat_app/models/token_model.dart';
import 'package:chat_app/pages/auth/splash_screen.dart';
import 'package:chat_app/register_providers.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/utils/functions.dart';
import 'package:chat_app/utils/io_system.dart';
import 'package:chat_app/utils/storage_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

StorageHelper storageHelper = StorageHelper();
IOSystem ioSystem = IOSystem();
TokenModel userData;

Dio dio = Dio();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  storageHelper.prefs = await SharedPreferences.getInstance();
  dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
    String token = storageHelper.getToken();
    options.baseUrl = '$API';
    options.headers['Authorization'] = 'Bearer $token';
    print(options);
    return options; //continue
  }));

  runApp(RegisterProviders());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
