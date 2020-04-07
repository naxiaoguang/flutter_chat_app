import 'package:chat_app/main.dart';
import 'package:chat_app/utils/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

IO.Socket kSocket;

class IOSystem {
  void init(String uuid) {
    if (kSocket == null) {
      kSocket = IO.io('http://localhost:3000/', <String, dynamic>{
        'transports': ['websocket', 'polling'],
        'query': 'uuid=$uuid'
      });
    }
  }

  void connectSocket() {
    String uuid = storageHelper.getUUID();
    if (uuid != null) {
      kSocket?.disconnect();
      init(uuid);
      try {
        kSocket.on('connect', (data) {
          print('qweqwe');
          kSocket.emit('register', {"uuid": uuid});

          kSocket.on('receive_msg', (data) {});

          kSocket.on('active_users', (data) {});
        });
      } catch (e) {
        print(e);
      }
    }
  }

  void sendMsg({String msg, String room}) {
    kSocket.emit('send_msg', {"room": room, "message": msg, "onCreate": '${DateTime.now()}', 'sender': userData.uuid});
  }

  void disconnectSocket() async {
    try {
      kSocket.disconnect();
      kSocket = null;
      print('SOCKET DISCONNECTED');
    } catch (e) {
      print(e);
    }
  }
}
