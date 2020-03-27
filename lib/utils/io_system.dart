import 'dart:convert';
import 'package:chat_app/models/io/io_user_model.dart';
import 'package:rxdart/subjects.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

IO.Socket kSocket;
PublishSubject messageStream = PublishSubject();
PublishSubject activeUserStream = PublishSubject();

class IOSystem {
  static void connectSocket({String ip, String uuid}) async {
    kSocket?.disconnect();
    print('ewrw');
    kSocket = await IO.io('http://192.168.10.71:3000/', <String, dynamic>{
      'transports': ['websocket', 'polling'],
      'query': 'uuid=$uuid'
    });
    kSocket.connect();
    try {
      kSocket.on('connect', (data) {
        print('qweqwe');
        kSocket.emit('register', {"uuid": "$uuid", "uname": "Mobil"});

        kSocket.on('receive_msg', (data) {
          messageStream.add(data);
        });

        kSocket.on('active_users', (data) {
          activeUserStream.add(data);
        });
      });
    } catch (e) {
      print(e);
    }
  }

  static void sendMsg({String msg, String receiver}) {
    kSocket.emit('send_msg',
        {"to": receiver, "message": msg, "onCreate": '${DateTime.now()}'});
  }

  static void disconnectSocket() async {
    try {
      kSocket.disconnect();
      print('SOCKET DISCONNECTED');
    } catch (e) {
      print(e);
    }
  }
}
