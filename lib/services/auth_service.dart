import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_wallet/models/sign_in_form_model.dart';
import 'package:e_wallet/models/sign_up_form_model.dart';
import 'package:e_wallet/models/user_model.dart';
import 'package:e_wallet/shared/shared_values.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  Dio dio = Dio();

  Future<bool> checkEmail(String email) async {
    try {
      //memanggil api
      final res =
          await dio.post('$baseUrl/is-email-exist', data: {'email': email});

      if (res.statusCode == 200) {
        return res.data['is_email_exist'];
      } else {
        return res.data['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(SignUpFormModel data) async {
    try {
      final res = await dio.post("$baseUrl/register", data: data.toJson());
      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(res.data);
        user = user.copyWith(password: data.password);
        await storeCredential(user);
        return user;
      } else {
        throw res.data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(SignInFormModel data) async {
    try {
      final res = await dio.post("$baseUrl/login", data: data.toJson());
      print(res.data);
      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(res.data);
        await storeCredential(user);

        return user;
      } else {
        throw res.data['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeCredential(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  Future<SignInFormModel> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> values = await storage.readAll();
      if (values['email'] == null || values['password'] == null) {
        throw 'unauthenticated';
      } else {
        final SignInFormModel data = SignInFormModel(
            email: values['email'], password: values['password']);
        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';
    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');
    if (value != null) {
      token = 'Bearer $value';
    }
    return token;
  }

  Future<void> clearLocalStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
