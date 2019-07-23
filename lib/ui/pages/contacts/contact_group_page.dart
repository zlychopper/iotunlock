import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iot_unlock/common/constant.dart';
import 'package:iot_unlock/data/entity/entities.dart';
import 'package:iot_unlock/utils/Utils.dart';
import 'package:iot_unlock/utils/sp_helper.dart';
import 'package:iot_unlock/utils/sp_util.dart';

class ContactGroupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactGroupPageState();
  }
}

class ContactGroupPageState extends State<ContactGroupPage> {
  UserDetailEntity _detailEntity;
  var currentGroup;
  final _biggerFont = const TextStyle(fontSize: 18);
  final _biggestFont = const TextStyle(fontSize: 20);
  @override
  void initState() {
    super.initState();
    String currentUser = SpUtil.getString(Constant.key_current_user);
    _detailEntity = SpHelper.getObject<UserDetailEntity>(currentUser);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        children: _detailEntity.groups.map((group) {
          return ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(
                  group.name,
                  style: _biggestFont,
                ),
              );
            },
            body: _buildGroup(group),
            isExpanded: currentGroup == group,
          );
        }).toList(),
        expansionCallback: (index, bool) {
          _setCurrentIndex(index);
        },
      ),
    );
  }

  Widget _buildGroup(GroupEntity group) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        return _buildRow(group.users[index]);
      },
      itemCount: group.users.length,
    );
  }

  Widget _buildRow(int id) {
    UserEntity user = _getUser(id);

    return GestureDetector(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: new SizedBox(
              width: 50.0,
              height: 50.0,
              child: SvgPicture.asset(
                Utils.getImgPath(user.icon),
              ),
            ),
            title: new Text(
              user.name,
              style: _biggerFont,
            ),
            trailing: Icon(
              Icons.navigate_next,
              color: Colors.grey,
            ),
          ),
          Divider(),
        ],
      ),
      onTap: () {},
    );
  }

  UserEntity _getUser(int id) {
    for (UserEntity user in _detailEntity.contacts) {
      if (user.id == id) {
        return user;
      }
    }
    return null;
  }

  void _setCurrentIndex(index) {
    setState(() {
      if (currentGroup == _detailEntity.groups[index]) {
        currentGroup = null;
      } else {
        currentGroup = _detailEntity.groups[index];
      }
    });
  }
}
