import 'dart:async';

import 'package:chat_app/main.dart';
import 'package:rxdart/subjects.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

IO.Socket kSocket;

class IOSystem {
  static StreamController _ctrl = new StreamController.broadcast();
  PublishSubject aa = new PublishSubject();
  Stream str = _ctrl.stream;

  IOSystem() {
    print('q333q');
  }

  PublishSubject messageStream = PublishSubject(onListen: () {
    print('listen');
  });

  void init(String uuid) {
    if (kSocket == null) {
      kSocket = IO.io('http://localhost:3060/', <String, dynamic>{
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

          kSocket.on('receive_msg', (data) {
            print('MSG: $data');
            aa.add(data);
            if (!_ctrl.isClosed) {
              messageStream.add(data);
              messageStream.sink.add(data);
              _ctrl.sink.add(data);
            }
          });

          kSocket.on('active_users', (data) {});
        });
      } catch (e) {
        print(e);
      }
    }
  }

  void sendMsg({String msg, String room}) {
    kSocket?.emit('send_msg', {"room": room, "message": msg, "onCreate": '${DateTime.now()}', 'sender': userData.uuid});
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

  void closeStreams() {
    //  _ctrl.close();
    //messageStream.close();
  }
}
