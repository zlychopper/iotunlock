import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:iot_unlock/res/strings.dart';

import 'contacts/contacts_page.dart';
import 'home/home_page.dart';
import 'mine/mine_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  final List<Widget> _children = [HomePage(), ContactsPage(), MinePage()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(IntlUtil.getString(context, Ids.titleHome)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text(IntlUtil.getString(context, Ids.titleContacts)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(IntlUtil.getString(context, Ids.titleMine)),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onTapClicked,
      ),
      body: _children[_currentIndex],
    );
  }

  void _onTapClicked(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
