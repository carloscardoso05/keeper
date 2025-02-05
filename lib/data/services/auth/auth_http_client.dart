import 'package:keeper/data/services/keeper_http.dart';
import 'package:keeper/domain/dtos/credentials.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:result_dart/result_dart.dart';

class AuthHttpClient {
  final KeeperHttp _http;

  AuthHttpClient(this._http);

  AsyncResult<User> login(Credentials credentials) async {
    final response = _http.post('/login', {
      'password': credentials.password,
      'email': credentials.email,
    });

    return response.map((response) => User.fromJson(response.data));
  }
}
