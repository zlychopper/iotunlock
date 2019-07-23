import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iot_unlock/common/constant.dart';
import 'package:iot_unlock/data/entity/entities.dart';
import 'package:iot_unlock/models/models.dart';
import 'package:iot_unlock/res/colors.dart';
import 'package:iot_unlock/res/strings.dart';
import 'package:iot_unlock/res/styles.dart';
import 'package:iot_unlock/ui/pages/loginreg/login_page.dart';
import 'package:iot_unlock/ui/widgets/common_arrow.dart';
import 'package:iot_unlock/utils/NavigatorUtil.dart';
import 'package:iot_unlock/utils/Utils.dart';
import 'package:iot_unlock/utils/sp_helper.dart';
import 'package:iot_unlock/utils/sp_util.dart';

import 'modify_pwd_page.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MinePageState();
  }
}

class MinePageState extends State<MinePage>{
  UserDetailEntity _detailEntity;

  @override
  Widget build(BuildContext context) {
    String currentUser = SpUtil.getString(Constant.key_current_user);
    _detailEntity = SpHelper.getObject<UserDetailEntity>(currentUser);
    return new Scaffold(
        backgroundColor: Colours.gray_e4,
//      resizeToAvoidBottomInset: false,
        body: buildBody());
  }

  Widget buildAvatar() {
    Widget avatar = new SvgPicture.asset(
      Utils.getImgPath('avatar.svg'),
    );
    return new Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: <Widget>[
          new SizedBox(
            width: 50.0,
            height: 50.0,
            child: avatar,
          ),
          Text(
            _detailEntity.user.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget buildBody() {
    return ListView(
      children: <Widget>[
        buildAvatar(),
        Gaps.vGap15,
        CommonArrow(ComModel(
            title: IntlUtil.getString(context, Ids.about_phone_no),
            extra: _detailEntity.user.phone)),
        CommonArrow(ComModel(
          title: IntlUtil.getString(context, Ids.about_modify_pwd),
          page: ModifyPwdPage(),
        )),
        CommonArrow(ComModel(
            title: IntlUtil.getString(context, Ids.about_sys_version),
            extra: 'V1.2.1')),
        CommonArrow(ComModel(
          title: IntlUtil.getString(context, Ids.about_share),
        )),
        CommonArrow(ComModel(
          title: IntlUtil.getString(context, Ids.about_logout),
        ),f: _showLoginOutDialog,),
      ],
    );
  }

  void _logout(){
    SpUtil.remove(Constant.key_login_info);
    NavigatorUtil.pushReplacePage(context, LoginPage());
  }

  void _showLoginOutDialog() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: Text(
                IntlUtil.getString(ctx, Ids.about_logout_confirm),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  IntlUtil.getString(ctx, Ids.cancel),
                  style: TextStyles.listExtra2,
                ),
                onPressed: () {
                  NavigatorUtil.pop(ctx);
                },
              ),
              FlatButton(
                child: Text(
                  IntlUtil.getString(ctx, Ids.confirm),
                  style: TextStyles.listExtra,
                ),
                onPressed: () {
                  NavigatorUtil.pop(ctx);
                  _logout();
                },
              ),
            ],
          );
        });
  }
}
