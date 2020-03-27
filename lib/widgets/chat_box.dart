import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  final AlignPos align;
  final String message;

  const ChatBox({Key key, this.align = AlignPos.LEFT, this.message})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (align == AlignPos.LEFT) {
      return Align(
        alignment: Alignment.centerLeft,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(bottom: 8, top: 8),
              constraints: BoxConstraints(maxWidth: constraints.maxWidth * .7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$message',
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
      );
    } else {
      return Align(
        alignment: Alignment.centerRight,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(bottom: 8, top: 8),
              constraints: BoxConstraints(maxWidth: constraints.maxWidth * .7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$message',
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
      );
    }
  }
}

enum AlignPos { LEFT, RIGHT }
