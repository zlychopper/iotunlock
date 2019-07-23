class LoginReq{
  String accountName;
  String password;
  String captchaCode;
  String captchaKey;

  LoginReq(this.accountName, this.password,this.captchaCode,this.captchaKey);

  LoginReq.fromJson(Map<String, dynamic> json)
      : accountName = json['accountName'],
        password = json['password'],
        captchaCode=json['captchaCode'],
        captchaKey=json['captchaKey'];

  Map<String, dynamic> toJson() => {
    'accountName': accountName,
    'password': password,
    'captchaCode': captchaCode,
    'captchaKey': captchaKey,
  };

  @override
  String toString() {
    return '{' +
        " \"accountName\":\"" +
        accountName +
        "\"" +
        ", \"password\":\"" +
        password +
        "\"" +
        ", \"captchaCode\":\"" +
        captchaCode +
        "\"" +
        ", \"captchaKey\":\"" +
        captchaKey +
        "\"" +
        '}';
  }
}