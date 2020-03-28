import 'package:chat_app/widgets/chat_box.dart';
import 'package:flutter/material.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  TextEditingController _textEditingController = TextEditingController();
  List<dynamic> messages = [
    {
      "id": 0,
      "sender": 1, // 1 me - 2 other
      "message": "Hello world!",
      "time": "2 days"
    },
    {
      "id": 0,
      "sender": 0, // 1 me - 2 other
      "message": "lorem ipsum dolor sit amet",
      "time": "10.40 AM"
    },
    {
      "id": 0,
      "sender": 0, // 1 me - 2 other
      "message": "adispicing",
      "time": "10.41 AM"
    },
    {
      "id": 0,
      "sender": 1, // 1 me - 2 other
      "message":
          "lorem ipsum lorem ipsum lorem lorem ipsum a sd as da sd as da sd as dsa asd",
      "time": "11.24 AM"
    },
    {
      "id": 0,
      "sender": 0, // 1 me - 2 other
      "message": "consectetur sit velit",
      "time": "11.27 AM"
    }
  ];

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
                        'Jonathan',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        'Online',
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
                    onPressed: () {},
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
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: messages.map((f) {
                    return ChatBox(
                      align: f['sender'] == 0 ? AlignPos.LEFT : AlignPos.RIGHT,
                      message: f['message'],
                      time: '${f['time']}',
                    );
                  }).toList(),
                ),
              ),
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
                          contentPadding: EdgeInsets.only(
                              left: 20, top: 20, bottom: 20, right: 20),
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
                                  setState(() {
                                    messages.add({
                                      "id": 0,
                                      "sender": 1, // 1 me - 2 other
                                      "message":
                                          "${_textEditingController.text}",
                                      "time": ""
                                    });
                                  });
                                  _textEditingController.clear();
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
