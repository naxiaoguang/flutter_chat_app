import 'package:chat_app/widgets/chat_item.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //rgb(28,26,26)
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
                      Icons.menu,
                      color: Colors.white70,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    'Chats',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  ChatItem(
                    fullName: 'Jonathan',
                    profileImg:
                        'https://www.leadmeonline.com/wp-content/uploads/2018/04/user-placeholder-man-10-6.jpg',
                    isOnline: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ChatItem(
                    fullName: 'Steve',
                    profileImg:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSSAbhj4m_d_j0jLRgbJkWdGDFfQnUxRUDjU0Ht8kB-oZfhEV9H',
                    isOnline: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ChatItem(
                    fullName: 'Jonathan',
                    profileImg:
                        'data:image/jpeg;base64,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',
                    isOnline: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ChatItem(
                    fullName: 'Steve',
                    profileImg:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT7sYW7g_RKMX1u4nFSKveD64YJyunIbWHkNFKGta_dcx9I6CCV',
                    isOnline: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ChatItem(
                    fullName: 'Jonathan',
                    profileImg:
                        'https://www.leadmeonline.com/wp-content/uploads/2018/04/user-placeholder-man-10-6.jpg',
                    isOnline: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ChatItem(
                    fullName: 'Steve',
                    profileImg:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSSAbhj4m_d_j0jLRgbJkWdGDFfQnUxRUDjU0Ht8kB-oZfhEV9H',
                    isOnline: true,
                  ),
                   SizedBox(
                    height: 24,
                  ),
                  ChatItem(
                    fullName: 'Steve',
                    profileImg:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSSAbhj4m_d_j0jLRgbJkWdGDFfQnUxRUDjU0Ht8kB-oZfhEV9H',
                    isOnline: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ChatItem(
                    fullName: 'Jonathan',
                    profileImg:
                        'https://www.leadmeonline.com/wp-content/uploads/2018/04/user-placeholder-man-10-6.jpg',
                    isOnline: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ChatItem(
                    fullName: 'Steve',
                    profileImg:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSSAbhj4m_d_j0jLRgbJkWdGDFfQnUxRUDjU0Ht8kB-oZfhEV9H',
                    isOnline: true,
                  ),
                   SizedBox(
                    height: 24,
                  ),
                  ChatItem(
                    fullName: 'Steve',
                    profileImg:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSSAbhj4m_d_j0jLRgbJkWdGDFfQnUxRUDjU0Ht8kB-oZfhEV9H',
                    isOnline: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ChatItem(
                    fullName: 'Jonathan',
                    profileImg:
                        'https://www.leadmeonline.com/wp-content/uploads/2018/04/user-placeholder-man-10-6.jpg',
                    isOnline: true,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ChatItem(
                    fullName: 'Steve',
                    profileImg:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSSAbhj4m_d_j0jLRgbJkWdGDFfQnUxRUDjU0Ht8kB-oZfhEV9H',
                    isOnline: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
