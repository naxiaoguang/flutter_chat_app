import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final List<CustomBottomNavItem> items;
  final int currentIndex;
  final void Function(int index) onTap;

  const CustomBottomNavigation(
      {Key key, this.items, this.currentIndex = 0, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      color: Color.fromRGBO(30, 30, 30, 1),
      child: Container(
        width: double.infinity,
        height: 72,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: this.items.map((f) {
              return IconButton(
                icon: Icon(
                  f.icon,
                  color: this.currentIndex == this.items.indexOf(f)
                      ? Colors.blue
                      : Colors.white70,
                  size: 28,
                ),
                onPressed: () {
                  this.onTap(this.items.indexOf(f));
                },
              );
            }).toList()),
      ),
    );
  }
}

class CustomBottomNavItem {
  final IconData icon;

  CustomBottomNavItem({this.icon});
}
