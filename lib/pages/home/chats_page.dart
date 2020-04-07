import 'package:chat_app/models/chat/conversation_model.dart';
import 'package:chat_app/providers/chat/chat_list_provider.dart';
import 'package:chat_app/utils/functions.dart';
import 'package:chat_app/widgets/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  int currentIndex = 0;
  ChatListProvider _chatListProvider;

  @override
  void initState() {
    // TODO: implement initState
    Functions.nextTick(() async {
      _chatListProvider = Provider.of<ChatListProvider>(context, listen: false);
      _chatListProvider.getChatList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(20, 20, 20, 1),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Consumer<ChatListProvider>(
              builder: (context, provider, _) {
                if (provider.hasError) {
                  return Text('hata');
                } else {
                  if (provider.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else {
                    if (provider?.res?.items != null && provider?.res?.items?.length != null && provider?.res?.items?.length != 0) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.all(16),
                        child: Column(
                            children: provider.res.items.map((f) {
                          return Column(
                            children: <Widget>[
                              ChatItem(
                                room: f.room,
                                fullName: f.senderTitle,
                                profileImg: f.profileImg,
                                isOnline: f.isOnline == 1 ? true : false,
                              ),
                              SizedBox(
                                height: 24,
                              ),
                            ],
                          );
                        }).toList()),
                      );
                    } else {
                      return Text('Veri yok');
                    }
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * 
 *  SizedBox(
                              height: 24,
                            ),
                            ChatItem(
                              fullName: 'Steve',
                              profileImg: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSSAbhj4m_d_j0jLRgbJkWdGDFfQnUxRUDjU0Ht8kB-oZfhEV9H',
                              isOnline: true,
                            ),
 */
