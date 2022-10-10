import 'package:dio/dio.dart';
import '../model/user_request_model.dart';
import '../model/user_model.dart';

class ReqResService {
  final String _baseUrl = 'https://reqres.in';
  final Dio _dio = Dio();

  Future<UserCreate> create(UserCreate user) async {
    try {
      var response = await _dio.post(
        '$_baseUrl/api/users',
        data: user.toMap(),
      );
      var userFromResponse = UserCreate.fromJson(response.data);
      return userFromResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<Iterable<UserModel>> getAll() async {
    try {
      var response = await _dio.get('$_baseUrl/api/users');
      if (response.statusCode != 200) {
        throw Exception('Fetch data users failed');
      }
      var data = response.data['data'] as List;
      var users = data.map((e) => UserModel.fromJson(e));
      return users;
    } catch (error) {
      rethrow;
    }
  }

  Future<UserUpdate?> update(UserUpdate user) async {
    try {
      var response = await _dio.put(
        '$_baseUrl/api/users/4',
        data: user.toMap(),
      );
      var userFromResponse = UserUpdate.fromJson(response.data);
      return userFromResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> remove() async {
    try {
      var response = await _dio.delete('$_baseUrl/api/users/4');
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
  }
}
