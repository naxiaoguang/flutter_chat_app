import 'package:chat_app/main.dart';
import 'package:chat_app/models/chat/conversation_model.dart';
import 'package:chat_app/providers/chat/conversation_provider.dart';
import 'package:chat_app/utils/functions.dart';
import 'package:chat_app/utils/io_system.dart';
import 'package:chat_app/widgets/chat_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversationPage extends StatefulWidget {
  final String title;
  final String room;
  final bool isOnline;

  const ConversationPage({Key key, @required this.title, @required this.room, this.isOnline}) : super(key: key);
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  TextEditingController _textEditingController = TextEditingController();
  ConversationProvider _conversationProvider;
  List<Items> _messages = [];
  IOSystem ioSys;
  @override
  void initState() {
    ioSys = new IOSystem();
    Functions.nextTick(() async {
      _conversationProvider = Provider.of<ConversationProvider>(context, listen: false);
      await _conversationProvider.getChatDetail(widget.room);
      _messages = _conversationProvider?.messages?.items ?? [];
      setState(() {
        _messages = List.from(_messages.reversed);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 20, 20, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: Material(
          //rgb(30,30,30)
          color: Color.fromRGBO(30, 30, 30, 1),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          child: Container(
            height: 100,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${widget.title}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        widget.isOnline ? 'Çevrimiçi' : 'Çevrimdışı',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.call,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Consumer<ConversationProvider>(builder: (context, provider, _) {
                //     return Text('${provider.messages.items.length}', style: TextStyle(color: Colors.white,));
                if (provider.hasError) {
                  return Text('hata...');
                } else {
                  if (provider.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    if (provider?.messages?.items != null && provider?.messages?.items?.length != null && provider?.messages?.items?.length != 0) {
                      return SingleChildScrollView(
                        reverse: true,
                        child: Column(
                          children: provider.messages.items.map((f) {
                            return ChatBox(
                              align: '${f.sender}' == '${userData.uuid}' ? AlignPos.RIGHT : AlignPos.LEFT,
                              message: f.message,
                              time: f.createdAt,
                            );
                          }).toList(),
                        ),
                      );
                    } else {
                      return Text('veri yok');
                    }
                  }
                }
              }),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.white70,
                        controller: _textEditingController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Type something here..',
                          hintStyle: TextStyle(color: Colors.white70),
                          contentPadding: EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
                          filled: true,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Material(
                              color: Color.fromRGBO(20, 20, 20, 1),
                              borderRadius: BorderRadius.circular(32),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(32),
                                child: Container(
                                  width: 48,
                                  height: 32,
                                  child: Center(
                                    child: Icon(
                                      Icons.send,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  print(userData.uuid);
                                  _conversationProvider.addMessage = {
                                    "sender": "${userData.uuid}",
                                    "message":"${_textEditingController.text}",
                                    "created_at": "${DateTime.now()}"

                                  };
                                  ioSystem.sendMsg(msg: '${_textEditingController.text}', room: '${widget.room}');
                                //  _textEditingController.clear();
                                },
                              ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
