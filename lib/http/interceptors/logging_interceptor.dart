import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('>> method ${data.method}');
    print('>> url ${data.url}');
    print('>> headers ${data.headers}');
    print('>> body ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('<< url ${data.url}');
    print('<< headers ${data.headers}');
    print('<< status code: ${data.statusCode}');
    print('<< body ${data.body}');
    return data;
  }
}