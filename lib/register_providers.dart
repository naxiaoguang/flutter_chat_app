import 'package:chat_app/main.dart';
import 'package:chat_app/providers/chat_list_provider.dart';
import 'package:chat_app/providers/shuffle_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShuffleProvider()),
        ChangeNotifierProvider(create: (_) => ChatListProvider()),
      ],
      child: App(),
    );
  }
}
