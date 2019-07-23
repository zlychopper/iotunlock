import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iot_unlock/common/constant.dart';
import 'package:iot_unlock/data/entity/entities.dart';
import 'package:iot_unlock/utils/Utils.dart';
import 'package:iot_unlock/utils/sp_helper.dart';
import 'package:iot_unlock/utils/sp_util.dart';

class ContactUserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactUserPageState();
  }
}

class ContactUserPageState extends State<ContactUserPage> {
  List<UserEntity> _contacts;
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  void initState() {
    super.initState();
    String currentUser = SpUtil.getString(Constant.key_current_user);
    UserDetailEntity detailEntity =
        SpHelper.getObject<UserDetailEntity>(currentUser);
    _contacts = detailEntity.contacts;
  }

  @override
  Widget build(BuildContext context) {
    return _buildGroup();
  }

  Widget _buildGroup() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        return _buildRow(_contacts[index]);
      },
      itemCount: _contacts.length,
    );
  }

  Widget _buildRow(UserEntity userEntity) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: new SizedBox(
            width: 50.0,
            height: 50.0,
            child: SvgPicture.asset(
              Utils.getImgPath(userEntity.icon),
            ),
          ),
          title: new Text(
            userEntity.name,
            style: _biggerFont,
          ),
        ),
        Divider(),
      ],
    );
  }
}
