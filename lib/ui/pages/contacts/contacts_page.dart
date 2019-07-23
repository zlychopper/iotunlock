import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:iot_unlock/res/strings.dart';
import 'package:iot_unlock/utils/NavigatorUtil.dart';

import 'contact_group_create_page.dart';
import 'contact_group_page.dart';
import 'contact_user_page.dart';

class ContactsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactsPageState();
  }
}

class ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(IntlUtil.getString(context, Ids.titleContacts)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 40,
            color: Colors.red,
            disabledColor: Colors.white,
            onPressed: _createGroup,
          )
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kTextTabBarHeight),
            child: new Container(
              color: Colors.white,
              child: new SafeArea(
                child: Column(
                  children: <Widget>[
                    new Expanded(child: new Container()),
                    new TabBar(
                      tabs: [
                        new Text(
                            IntlUtil.getString(context, Ids.titleContacts)),
                        new Text(IntlUtil.getString(context, Ids.titleGroup))
                      ],
                      indicatorColor: Colors.red,
                      labelColor: Colors.red,
                      unselectedLabelColor: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: new TabBarView(
            children: <Widget>[
              ContactUserPage(),
              ContactGroupPage(),
            ],
          ),
        ),
      ),
    );
  }

  void _createGroup() {
    NavigatorUtil.pushPage(context, ContactGroupCreatePage());
  }
}
