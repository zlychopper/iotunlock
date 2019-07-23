import 'user_info_vo.dart';

class LoginInfoVO{
  int isAdmin;
  String token;
  UserInfoVO userInfoVo;

  LoginInfoVO.fromJson(Map<String, dynamic> json):
      isAdmin=json['isAdmin'] as int,
      token = json['token'],
      userInfoVo = UserInfoVO.fromJson(json['userInfoVO']);

  Map<String, dynamic> toJson() => {
    'isAdmin': isAdmin,
    'token': token,
    'userInfoVO': userInfoVo,
  };
}