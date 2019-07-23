import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iot_unlock/common/constant.dart';
import 'package:iot_unlock/data/entity/entities.dart';
import 'package:iot_unlock/data/vo/login_info_vo.dart';
import 'package:iot_unlock/data/vo/user_info_vo.dart';
import 'package:iot_unlock/utils/NavigatorUtil.dart';
import 'package:iot_unlock/utils/sp_helper.dart';
import 'package:iot_unlock/utils/sp_util.dart';

import 'loginreg/login_page.dart';
import 'main_page.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    await SpUtil.getInstance();
    if(_isLogin()){
      _go2Main();
    }else{
      _go2Login();
    }
  }

  bool _isLogin(){
    LoginInfoVO loginInfoVO = SpUtil.getObj<LoginInfoVO>(
      Constant.key_login_info,
        (value){
          return LoginInfoVO.fromJson(value);
        }
    );
    if(loginInfoVO==null){
      return false;
    }
    print('token-----'+loginInfoVO.token);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '物联开锁',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
//    _timer.cancel();
    super.dispose();
  }

  void _go2Login() {
    NavigatorUtil.pushReplacePage(context, LoginPage());
  }

  void _go2Main() {
    NavigatorUtil.pushReplacePage(context, MainPage());
  }
}
