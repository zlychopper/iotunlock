import 'dart:typed_data';

import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:iot_unlock/common/constant.dart';
import 'package:iot_unlock/data/entity/entities.dart';
import 'package:iot_unlock/data/protocol/models.dart';
import 'package:iot_unlock/data/repository/user_repository.dart';
import 'package:iot_unlock/data/vo/user_info_vo.dart';
import 'package:iot_unlock/res/colors.dart';
import 'package:iot_unlock/res/dimens.dart';
import 'package:iot_unlock/res/strings.dart';
import 'package:iot_unlock/ui/pages/loginreg/forget_phone_page.dart';
import 'package:iot_unlock/ui/pages/loginreg/reg_phone_page.dart';
import 'package:iot_unlock/ui/widgets/input_text_label.dart';
import 'package:iot_unlock/ui/widgets/round_button.dart';
import 'package:iot_unlock/ui/widgets/toast.dart';
import 'package:iot_unlock/utils/NavigatorUtil.dart';
import 'package:iot_unlock/utils/Utils.dart';
import 'package:iot_unlock/utils/sp_util.dart';

import '../main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  TextEditingController _captchaController = TextEditingController();
  Uint8List _imgBytes;
  String _captchaKey;
  UserRepository _loginRepository;

  @override
  void initState() {
    _loginRepository = UserRepository();
    if (_imgBytes == null) {
      _refreshCaptcha();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colours.gray_e4,
//      resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: new Container(
            margin: EdgeInsets.all(0.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildLogo(),
                _buildUserName(),
                _buildPwd(),
                _buildCaptcha(),
//                _buildForgetReg(),
                _buildLoginButton(),
              ],
            ),
          ),
        ));
  }

  Widget _buildLogo() {
    return new Container(
      margin: EdgeInsets.only(top: 100),
      child: new Image.asset(
        Utils.getImgPath('logo.png'),
        width: 200,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _buildLoginButton() {
    return new RoundButton(
      text: IntlUtil.getString(context, Ids.user_login),
      margin: EdgeInsets.all(20),
      onPressed: () {
        _login();
      },
    );
  }

  Widget _buildUserName() {
    return new InputTextWithLabel(
      controller: _userNameController,
      labelText: IntlUtil.getString(context, Ids.label_account),
      hintText: IntlUtil.getString(context, Ids.input_user_name_hint),
    );
  }

  Widget _buildPwd() {
    return new InputTextWithLabel(
      controller: _pwdController,
      labelText: IntlUtil.getString(context, Ids.label_pwd),
      hintText: IntlUtil.getString(context, Ids.input_pwd_hint),
      hasSuffixIcon: true,
    );
  }

  Widget _buildCaptcha() {
    _captchaController.addListener((){
        if(_captchaController.text.contains(" ")){
          _captchaController.text=_captchaController.text.trim();
          _captchaController.selection=TextSelection.collapsed(offset: _captchaController.text.length);
        }
    });
    Widget cpatchaField = InputTextWithLabel(
      controller: _captchaController,
      labelText: IntlUtil.getString(context, Ids.label_check_code),
      hintText: IntlUtil.getString(context, Ids.input_check_code),
    );
    if (_imgBytes == null) {
      _imgBytes = Uint8List(1);
    }
    Widget img = Image.memory(
      _imgBytes,
      width: 100,
      fit: BoxFit.fitHeight,
    );
    return Padding(
      padding: EdgeInsets.all(0),
      child: Stack(
        children: <Widget>[
          cpatchaField,
          Positioned(
            right: 5,
            bottom: 5,
            child: GestureDetector(
              child: img,
              onTap: _refreshCaptcha,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForgetReg() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Container(
          padding: EdgeInsets.only(top: Dimens.gap_dp15, left: Dimens.gap_dp15),
          alignment: Alignment.centerLeft,
          child: new InkWell(
            child: new Text(
              IntlUtil.getString(context, Ids.user_forget_pwd),
              style:
                  new TextStyle(color: Colors.blue, fontSize: Dimens.font_sp14),
            ),
            onTap: () {
              _forgetPwd();
            },
          ),
        ),
        new Container(
          padding:
              EdgeInsets.only(top: Dimens.gap_dp15, right: Dimens.gap_dp15),
          alignment: Alignment.centerRight,
          child: new InkWell(
            child: new Text(
              IntlUtil.getString(context, Ids.user_register),
              style:
                  new TextStyle(color: Colors.blue, fontSize: Dimens.font_sp14),
            ),
            onTap: () {
              _reg();
            },
          ),
        )
      ],
    );
  }

  void _login() {
    String username = _userNameController.text.trim();
    String password = _pwdController.text.trim();
//    String username = 'admin';
//    String password = '123456';

    if (username.isEmpty || username.length < 3) {
      Toast.show(context, username.isEmpty ? "请输入用户名～" : "用户名至少3位～");
      return;
    }
    if (password.isEmpty || password.length < 3) {
      Toast.show(context, username.isEmpty ? "请输入密码～" : "密码至少3位～");
      return;
    }
    String captcha = _captchaController.text.trim();
    LoginReq loginReq = LoginReq(username, password,captcha, _captchaKey);
    _loginRepository.login(loginReq).then((value) {
      SpUtil.putObject(Constant.key_login_info, value);

      UserEntity user = UserEntity.fromJson({
        'account': username,
        'password': password,
        'id': 3,
        'name': '老牛',
        'phone': '13856454545',
        'icon': 'boy.svg',
      });
      _initContacts(user);
      _go2Main();

    }).catchError((e) {
      Toast.show(context, "登录失败$e");
      print(e);
    });
  }

  void _refreshCaptcha() {
    _loginRepository.getCheckCode().then((value) {
      _captchaKey = value.headers['CaptchaCode'][0];
      setState(() {
        _imgBytes = Uint8List.fromList(value.data);
      });
    }).catchError((error) {
      print(error);
    });
  }

  void _initContacts(UserEntity user) {
    SpUtil.putString(Constant.key_current_user, user.account);
    UserEntity zhangsan = UserEntity.fromJson({
      'account': 'zhangsan',
      'password': '1234',
      'id': 1,
      'name': '张三',
      'phone': '13812341324',
      'icon': 'boy.svg',
    });

    UserEntity lisi = UserEntity.fromJson({
      'account': 'lisi',
      'password': '1234',
      'id': 2,
      'name': '李四',
      'phone': '13514711471',
      'icon': 'girl.svg',
    });

    UserEntity liubei = UserEntity.fromJson({
      'account': 'liubei',
      'password': '1234',
      'id': 4,
      'name': '刘备',
      'phone': '13625822582',
      'icon': 'boy.svg',
    });

    UserEntity guanyu = UserEntity.fromJson({
      'account': 'guanyu',
      'password': '1234',
      'id': 5,
      'name': '关羽',
      'phone': '13336933639',
      'icon': 'boy.svg',
    });

    UserEntity lvbu = UserEntity.fromJson({
      'account': 'lvbu',
      'password': '1234',
      'id': 6,
      'name': '吕布',
      'phone': '13845644564',
      'icon': 'avatar.svg',
    });
    GroupEntity group1 = GroupEntity.fromJson({
      'name': 'family',
      'users': [2, 4, 6],
    });
    GroupEntity group2 = GroupEntity.fromJson({
      'name': 'company',
      'users': [1, 5],
    });
    List<UserEntity> users = [zhangsan, lisi, liubei, guanyu, lvbu];
    List<GroupEntity> groups = [group1, group2];
    UserDetailEntity detailEntity =
        UserDetailEntity(user, contacts: users, groups: groups);
    SpUtil.putObject(user.account, detailEntity);
  }

  void _reg() {
    NavigatorUtil.pushPage(context, RegPhonePage());
  }

  void _forgetPwd() {
    NavigatorUtil.pushPage(context, ForgetPhonePage());
  }

  void _go2Main() {
    NavigatorUtil.pushReplacePage(context, MainPage());
  }
}
