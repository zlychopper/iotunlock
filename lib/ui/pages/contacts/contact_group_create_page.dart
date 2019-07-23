import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iot_unlock/common/constant.dart';
import 'package:iot_unlock/data/entity/entities.dart';
import 'package:iot_unlock/res/strings.dart';
import 'package:iot_unlock/ui/widgets/input_text_label.dart';
import 'package:iot_unlock/ui/widgets/round_button.dart';
import 'package:iot_unlock/ui/widgets/toast.dart';
import 'package:iot_unlock/utils/NavigatorUtil.dart';
import 'package:iot_unlock/utils/Utils.dart';
import 'package:iot_unlock/utils/sp_helper.dart';
import 'package:iot_unlock/utils/sp_util.dart';

class ContactGroupCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactGroupCreatePageState();
  }
}

class ContactGroupCreatePageState extends State<ContactGroupCreatePage> {
  UserDetailEntity _detailEntity;
  TextEditingController _controller = TextEditingController();
  final _biggerFont = const TextStyle(fontSize: 18);
  List<bool> _checked = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(IntlUtil.getString(context, Ids.titleCreateGroup)),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: InputTextWithLabel(
            controller: _controller,
            hintText: IntlUtil.getString(context, Ids.input_group_name_hint),
            labelText: IntlUtil.getString(context, Ids.label_group_name),
          ),
        ),
        Expanded(
          child: _buildGroup(),
        ),
        _buildCreateButton(),
      ],
    );
  }

  Widget _buildGroup() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        return _buildRow(index);
      },
      itemCount: _detailEntity.contacts.length,
    );
  }

  Widget _buildRow(int index) {
    UserEntity userEntity = _detailEntity.contacts[index];
    return Column(
      children: <Widget>[
        CheckboxListTile(
          onChanged: (change) {
            setState(() {
              _checked[index] = !_checked[index];
            });
          },
          value: _checked[index],
          controlAffinity: ListTileControlAffinity.trailing,
          secondary: new SizedBox(
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

  Widget _buildCreateButton() {
    return new RoundButton(
      text: IntlUtil.getString(context, Ids.create),
      margin: EdgeInsets.all(20),
      onPressed: () {
        _createGroup();
      },
    );
  }

  void _createGroup() {
    String name = _controller.text.trim();
    if (name.isEmpty) {
      Toast.show(
          context, IntlUtil.getString(context, Ids.input_group_name_hint));
      return;
    }

    for (int i = 0; i < _detailEntity.groups.length; i++) {
      if (name == _detailEntity.groups[i].name) {
        Toast.show(
            context, IntlUtil.getString(context, Ids.group_name_exist_hint));
        return;
      }
    }

    List<int> users = [];
    for (int i = 0; i < _checked.length; i++) {
      if (_checked[i]) {
        UserEntity u = _detailEntity.contacts[i];
        users.add(u.id);
      }
    }
    GroupEntity entity = GroupEntity.fromJson({
      'name': name,
      'users': users,
    });
    if (_detailEntity.groups == null) _detailEntity.groups = [];
    _detailEntity.groups.add(entity);
    SpUtil.putObject(_detailEntity.user.account, _detailEntity);
    NavigatorUtil.pop(context);
  }

  @override
  void initState() {
    super.initState();
    String currentUser = SpUtil.getString(Constant.key_current_user);
    _detailEntity = SpHelper.getObject<UserDetailEntity>(currentUser);
    for (int i = 0; i < _detailEntity.contacts.length; i++) {
      _checked.add(false);
    }
  }
}
