import 'package:chat_app/widgets/chat_item.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 20, 20, 1),
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
