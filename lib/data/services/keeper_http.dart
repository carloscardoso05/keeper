import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

class KeeperHttp {
  final Dio _dio;

  KeeperHttp(this._dio);

  AsyncResult<Response<T>> _makeRequest<T>(
      Future<Response<T>> Function() request) async {
    try {
      final response = await request();
      return Success(response);
    } on DioException catch (e) {
      return Failure(e);
    }
  }

  AsyncResult<Response> get(String url) {
    return _makeRequest(
      () => _dio.get(url),
    );
  }

  AsyncResult<Response> post(String url, dynamic data) {
    return _makeRequest(
      () => _dio.post(url, data: data),
    );
  }

  AsyncResult<Response> put(String url, dynamic data) {
    return _makeRequest(
      () => _dio.put(url, data: data),
    );
  }

  AsyncResult<Response> patch(String url, dynamic data) {
    return _makeRequest(
      () => _dio.patch(url, data: data),
    );
  }

  AsyncResult<Response> delete(String url) {
    return _makeRequest(
      () => _dio.delete(url),
    );
  }
}
