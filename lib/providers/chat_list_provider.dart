import 'dart:convert';

import 'package:chat_app/models/chat/chat_list_model.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ChatListProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMsg = '';
  ChatListModel _res = ChatListModel();

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMsg => _errorMsg ?? '';
  ChatListModel get res => _res;

  Future<void> getChatList() async {
    _hasError = false;
    _isLoading = true;
    try {
      dio.post('/chat/list', data: {
        "offset": 0,
      }).then((res) {
        _res = ChatListModel.fromJson(res.data is String ? jsonDecode(res.data) : res.data);
      });
    } catch (e) {
      _hasError = true;
      _errorMsg = '$e';
    }
    _isLoading = false;
  }
}
