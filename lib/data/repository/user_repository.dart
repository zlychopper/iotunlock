import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:iot_unlock/common/constant.dart';
import 'package:iot_unlock/data/api/api.dart';
import 'package:iot_unlock/data/protocol/models.dart';
import 'package:iot_unlock/data/vo/login_info_vo.dart';
import 'package:iot_unlock/data/vo/response_vo.dart';
import 'package:iot_unlock/utils/dio_util.dart';

class UserRepository {

  Future<Response<List<int>>> getCheckCode() async {
    return await DioUtil().postBytes(Api.CAPTCHA_CODE);
  }

  Future<LoginInfoVO> login(LoginReq loginReq) async {
    ResponseVO<Map<String, dynamic>> vo =
    await DioUtil().post(Api.LOGIN, data: loginReq.toJson());
    return LoginInfoVO.fromJson(vo.data);
  }

  Future<void> logout(String token) async {

  }
}
