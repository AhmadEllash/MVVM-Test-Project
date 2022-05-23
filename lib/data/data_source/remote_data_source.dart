import 'package:advanced_flutter/data/Network/app_api.dart';
import 'package:advanced_flutter/data/Network/requests.dart';
import 'package:advanced_flutter/data/response/responses.dart';

abstract class RemoteDataSource{
  Future<AuthResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource{
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);
  @override
  Future<AuthResponse> login(LoginRequest loginRequest) {
    return _appServiceClient.login(loginRequest.email, loginRequest.password);
  }

}