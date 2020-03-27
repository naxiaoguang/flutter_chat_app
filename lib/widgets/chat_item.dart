import 'package:chat_app/pages/conversation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String fullName;
  final String profileImg;
  final bool isOnline;

  const ChatItem({Key key, this.fullName, this.isOnline, this.profileImg})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ConversationPage(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: CircleAvatar(
                        radius: 24,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.network('$profileImg'),
                        ),
                        backgroundColor: Colors.amber,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: isOnline ? Colors.green : Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '$fullName',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'lorem ipsum dolor sit amet...',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    'now',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.indigo,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
