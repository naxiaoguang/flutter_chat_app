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
                child: Column(
                  children: <Widget>[],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
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
                                    child: Icon(Icons.send),
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
