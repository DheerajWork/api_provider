import 'package:api_provider/my_bloc/api_repsonse.dart';
import 'package:api_provider/my_bloc/dio/dio_client.dart';
import 'package:api_provider/my_bloc/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart'as encrypt;
import 'package:encrypt/encrypt.dart';

class AuthRepository {
  AuthRepository({required this.dioClient});
  final DioClient dioClient;

  Future<ApiResponse> register(
      {String? fullName,
      String? email,
      String? gender,
      String? fcmToken,
      String? username}) async {
    try {
      Response response = await dioClient.post(
        AppConstant.customerRegister,
        data: {
          "mobileCredentials": {
            "username": "sBw28NJNgmD3R6qt3tzewQ==",
            "password": "oINnHsfJRmXHnaFML+ITZw==",
            "deviceType": "Lt6pJoQQtI8mc8tJhmEpSg==",
            "deviceId": "PDaH0I6wXk2+0mrovDcY3dM3kAwrmzT2ttlV5fImLJg=",
            "appVersion": "1e2hD0yZ34pWNJA9DbvZFA=="
          },
          "user": {"username": encryptionString(username!)},
          "customerDetails": {
            "fullName": encryptionString(fullName!),
            "email": encryptionString(email!),
            "gender": encryptionString(gender!),
            "fcmToken": encryptionString('test')
          }
        },
      );
      return ApiResponse.withSuccess(response);
    } on DioError catch (e) {
      return ApiResponse.withError(e.response);
    }
  }

  Future<ApiResponse> login({String? username}) async {
    try {
      Response response = await dioClient.post(
        AppConstant.customerLogin,
        data: {
          "mobileCredentials": {
            "username": "sBw28NJNgmD3R6qt3tzewQ==",
            "password": "oINnHsfJRmXHnaFML+ITZw==",
            "deviceType": "Lt6pJoQQtI8mc8tJhmEpSg==",
            "deviceId": "PDaH0I6wXk2+0mrovDcY3dM3kAwrmzT2ttlV5fImLJg=",
            "appVersion": "1e2hD0yZ34pWNJA9DbvZFA=="
          },
          "appLogin": {"username": encryptionString(username!)}
        },
      );
      return ApiResponse.withSuccess(response);
    } on DioError catch (e) {
      return ApiResponse.withError(e.response);
    }
  }

  Future<ApiResponse> verifyOtp({String? username, String? otp}) async {
    try {
      Response response = await dioClient.post(
        AppConstant.verifyOtp,
        data: {
          "mobileCredentials": {
            "username": "sBw28NJNgmD3R6qt3tzewQ==",
            "password": "oINnHsfJRmXHnaFML+ITZw==",
            "deviceType": "Lt6pJoQQtI8mc8tJhmEpSg==",
            "deviceId": "PDaH0I6wXk2+0mrovDcY3dM3kAwrmzT2ttlV5fImLJg=",
            "appVersion": "1e2hD0yZ34pWNJA9DbvZFA=="
          },
          "otpReq": {
            "username": encryptionString(username!),
            "otpCode": encryptionString(otp!)
          }
        },
      );
      return ApiResponse.withSuccess(response);
    } on DioError catch (e) {
      return ApiResponse.withError(e.response);
    }
  }
}



decryptString(String text) {
  final iv = IV.fromLength(128);
  final key = encrypt.Key.fromUtf8(AppConstant.key);

  final encrypter = Encrypter(AES(key, mode: AESMode.ecb, padding: 'PKCS7'));

  final decrypted = encrypter.decrypt(Encrypted.fromBase64(text), iv: iv);

  return decrypted;
}

String encryptionString(String plainText) {
  final iv = IV.fromLength(128);
  final key = encrypt.Key.fromUtf8(AppConstant.key);

  final encrypter = Encrypter(AES(key, mode: AESMode.ecb, padding: 'PKCS7'));
  final encrypted = encrypter.encrypt(plainText, iv: iv);

  return encrypted.base64;
}
