import 'package:chat_app/pages/auth/login_page.dart';
import 'package:chat_app/pages/home/chats_page.dart';
import 'package:chat_app/pages/home/home_page.dart';
import 'package:chat_app/widgets/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';

class HomeNavigator extends StatefulWidget {
  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  int _currentIndex = 2;
  List<Widget> _items = [HomePage(), Text(''), ChatsPage(), Text('')];
  List<String> _titles = ['Home', 'Camera', 'Chats', 'Profile'];
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
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => LoginPage()
                      ));
                    },
                  ),
                  Text(
                    '${_titles[_currentIndex]}',
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
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (int index) {
          if (index == _currentIndex) return;
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          CustomBottomNavItem(icon: Icons.home),
          CustomBottomNavItem(icon: Icons.camera_alt),
          CustomBottomNavItem(icon: Icons.chat),
          CustomBottomNavItem(icon: Icons.person),
        ],
      ),
      body: _items[_currentIndex],
    );
  }
}
