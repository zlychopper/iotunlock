import 'dart:io';

import 'package:dio/dio.dart';
import 'package:iot_unlock/data/vo/response_vo.dart';

typedef ProgressCallback = void Function(int count, int total);

class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}

class DioUtil {
  String _codeKey = "code";
  String _msgKey = "message";
  String _dataKey = "data";
  static const int connect_time_out = 1000 * 5;
  static const int receive_time_out = 1000 * 5;
  static Dio _dio;
  static final DioUtil _instance = DioUtil._init();

  DioUtil._init() {
    _dio = Dio();
  }

  factory DioUtil() {
    return _instance;
  }

  static void openDebug() {
    if (_dio != null) {
      _dio.interceptors.add(LogInterceptor(responseBody: true));
    }
  }

  void setCookie(String cookie) {
    Map<String, dynamic> _headers = {};
    _headers['Cookie'] = cookie;
    _dio.options.headers.addAll(_headers);
  }

  void setOptions(BaseOptions options) {
    if (_dio != null) {
      if (options == null) {
        options = getDefOptions();
      }
      _dio.options = options;
    }
  }

  static BaseOptions getDefOptions() {
    return BaseOptions(
      connectTimeout: connect_time_out,
      receiveTimeout: receive_time_out,
    );
  }

  Future<ResponseVO<T>> post<T>(String path,
      {data, Options options, CancelToken cancelToken}) async {
    return request(Method.post, path,
        data: data, options: options, cancelToken: cancelToken);
  }

  Future<ResponseVO<T>> request<T>(String method, String path,
      {data, Options options, CancelToken cancelToken}) async {
    Response<Map<String, dynamic>> response = await _dio.request(path,
        data: data,
        options: _checkOptions(method, options),
        cancelToken: cancelToken);
    String _msg;
    int _code;
    T _data;
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        _msg = response.data[_msgKey];
        _code = response.data[_codeKey];
        _data = response.data[_dataKey];
        if (_code != 0) {
          return new Future.error(new DioError(
            response: response,
            message: "code:$_code,$_msg",
            type: DioErrorType.RESPONSE,
          ));
        } else {
          return ResponseVO(_msg, _code, _data);
        }
      } catch (e) {
        return new Future.error(new DioError(
          response: response,
          message: "data parsing exception...",
          type: DioErrorType.RESPONSE,
        ));
      }
    }
    return new Future.error(new DioError(
      response: response,
      message: "statusCode: $response.statusCode, service error",
      type: DioErrorType.RESPONSE,
    ));
  }

  Future<ResponseRVO<T>> requestR<T>(String method, String path,
      {data, Options options, CancelToken cancelToken}) async {
    Response<Map<String, dynamic>> response = await _dio.request(path,
        data: data,
        options: _checkOptions(method, options),
        cancelToken: cancelToken);
    String _msg;
    int _code;
    T _data;
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        _msg = response.data[_msgKey];
        _code = response.data[_codeKey];
        _data = response.data[_dataKey];
        if (_code != 0) {
          return new Future.error(new DioError(
            response: response,
            message: "code:$_code,$_msg",
            type: DioErrorType.RESPONSE,
          ));
        } else {
          return ResponseRVO(_msg, _code, _data, response);
        }
      } catch (e) {
        return new Future.error(new DioError(
          response: response,
          message: "data parsing exception...",
          type: DioErrorType.RESPONSE,
        ));
      }
    }

    return new Future.error(new DioError(
      response: response,
      message: "statusCode: $response.statusCode, service error",
      type: DioErrorType.RESPONSE,
    ));
  }

  Future<Response<ResponseBody>> _requestStream(String method, String path,
      {data, Options options, CancelToken cancelToken}) async {
    Options op = _checkOptions(method, options);
    op.responseType = ResponseType.stream;
    Response<ResponseBody> response = await _dio.request(path,
        data: data, options: op, cancelToken: cancelToken);

    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        return response;
      } catch (e) {
        return new Future.error(new DioError(
          response: response,
          message: "data parsing exception...",
          type: DioErrorType.RESPONSE,
        ));
      }
    }

    return new Future.error(new DioError(
      response: response,
      message: "statusCode: $response.statusCode, service error",
      type: DioErrorType.RESPONSE,
    ));
  }

  Future<Response<List<int>>> _requestBytes(String method, String path,
      {data, Options options, CancelToken cancelToken}) async {
    Options op = _checkOptions(method, options);
    op.responseType = ResponseType.bytes;
    Response<List<int>> response = await _dio.request(path,
        data: data, options: op, cancelToken: cancelToken);

    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        return response;
      } catch (e) {
        return new Future.error(new DioError(
          response: response,
          message: "data parsing exception...",
          type: DioErrorType.RESPONSE,
        ));
      }
    }

    return new Future.error(new DioError(
      response: response,
      message: "statusCode: $response.statusCode, service error",
      type: DioErrorType.RESPONSE,
    ));
  }

  Future<Response<ResponseBody>> getStream(String path,
      {data, Options options, CancelToken cancelToken}) async {
    return _requestStream(Method.get, path,
        data: data, options: options, cancelToken: cancelToken);
  }

  Future<Response<ResponseBody>> postStream(String path,
      {data, Options options, CancelToken cancelToken}) async {
    return _requestStream(Method.post, path,
        data: data, options: options, cancelToken: cancelToken);
  }

  Future<Response<List<int>>> getBytes(String path,
      {data, Options options, CancelToken cancelToken}) async {
    return _requestBytes(Method.get, path,
        data: data, options: options, cancelToken: cancelToken);
  }

  Future<Response<List<int>>> postBytes(String path,
      {data, Options options, CancelToken cancelToken}) async {
    return _requestBytes(Method.post, path,
        data: data, options: options, cancelToken: cancelToken);
  }

  /// Download the file and save it in local. The default http method is "GET",you can custom it by [Options.method].
  /// [urlPath]: The file url.
  /// [savePath]: The path to save the downloading file later.
  /// [onProgress]: The callback to listen downloading progress.please refer to [OnDownloadProgress].
  Future<Response> download(
    String urlPath,
    savePath, {
    ProgressCallback onProgress,
    CancelToken cancelToken,
    data,
    Options options,
  }) {
    return _dio.download(urlPath, savePath,
        onReceiveProgress: onProgress,
        cancelToken: cancelToken,
        data: data,
        options: options);
  }

  Options _checkOptions(method, options) {
    if (options == null) {
      options = new Options();
    }
    options.method = method;
    return options;
  }
}
