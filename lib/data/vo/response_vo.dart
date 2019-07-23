import 'package:dio/dio.dart';

class ResponseVO<T> {
  String msg;
  int code;
  T data;

  ResponseVO(this.msg, this.code, this.data);

  @override
  String toString() {
    StringBuffer sb = StringBuffer();
    sb
      ..write("{")
      ..write("\"code\":$code")
      ..write("\"msg\":$msg")
      ..write("\"data\":$data")
      ..write("}");
    return sb.toString();
  }
}

class ResponseRVO<T> {
  String msg;
  int code;
  T data;
  Response response;

  ResponseRVO(this.msg, this.code, this.data, this.response);

  @override
  String toString() {
    StringBuffer sb = StringBuffer();
    sb
      ..write("{")
      ..write("\"code\":$code")
      ..write("\"msg\":$msg")
      ..write("\"data\":$data")
      ..write("}");
    return sb.toString();
  }
}
