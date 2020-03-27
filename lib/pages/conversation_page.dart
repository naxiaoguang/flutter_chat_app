import 'package:flutter/material.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
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
                    onPressed: () {},
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
                  children: <Widget>[
                      Align(
                      alignment: Alignment.centerRight,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(bottom: 8, top: 8),
                            constraints: BoxConstraints(
                                maxWidth: constraints.maxWidth * .7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Lorem ipsum dolor sit amet',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'now',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                   
                    Align(
                      alignment: Alignment.centerLeft,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(bottom: 8, top: 8),
                            constraints: BoxConstraints(
                                maxWidth: constraints.maxWidth * .7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Lorem ipsum',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      '10.04 AM',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(64, 64, 64, 1),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(bottom: 8, top: 8),
                            constraints: BoxConstraints(
                                maxWidth: constraints.maxWidth * .7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Lorem ipsum dolor sit amet',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      '10.04 AM',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(64, 64, 64, 1),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(bottom: 8, top: 8),
                            constraints: BoxConstraints(
                                maxWidth: constraints.maxWidth * .7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Lorem ipsum dolor sit amet',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'now',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(bottom: 8, top: 8),
                            constraints: BoxConstraints(
                                maxWidth: constraints.maxWidth * .7),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'adispicing sit elit',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      'now',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.white70,
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
                                onTap: () {},
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
