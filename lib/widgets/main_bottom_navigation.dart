import 'package:architecture/notifiers/BottomNavigationNotifierImpl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MainBottomNavigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainBottomNavigationState();
}

class _MainBottomNavigationState extends State<MainBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = context.watch<BottomNavNotifierImpl>().selectedPage;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Opacity(
              opacity: 1,
              child: Icon(Icons.list,
                  size: 18,
                  color:
                      (selectedIndex == 0 ? Colors.blue : Colors.white))),
          title: Container(
              child: Text(
                'List',
              ),
              margin: const EdgeInsets.only(top: 5)),
        ),
        BottomNavigationBarItem(
          icon: Opacity(
              opacity: 1,
              child: Icon(Icons.chat,
                  size: 18,
                  color:
                      (selectedIndex == 1 ? Colors.blue : Colors.white))),
          title: Container(
              child: Text(
                'Chat',
              ),
              margin: const EdgeInsets.only(top: 5)),
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      backgroundColor: Color(0xff323334),
      selectedFontSize: 12,
      unselectedFontSize: 12,
      unselectedItemColor: Colors.white,
      onTap: (value) {
        context.read<BottomNavNotifierImpl>().setSelectedItem(value);
      },
    );
  }
}
