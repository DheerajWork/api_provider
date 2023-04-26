import 'dart:convert';
import 'package:api_provider/bloc_test/data/api/api.dart';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:encrypt/encrypt.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';

class PostRepo {
  API api = API();

   fetchPosts({
    String? username
  }) async {
    try {
      Response response =
          (await api.sendRequest.post("api/v1/driverUserAppLogin",
            data: {
              "mobileCredentials": {
                "username": "sBw28NJNgmD3R6qt3tzewQ==",
                "password": "oINnHsfJRmXHnaFML+ITZw==",
                "deviceType": "Lt6pJoQQtI8mc8tJhmEpSg==",
                "deviceId": "PDaH0I6wXk2+0mrovDcY3dM3kAwrmzT2ttlV5fImLJg=",
                "appVersion": "1e2hD0yZ34pWNJA9DbvZFA=="
              },
              "appLogin": {
                "username": encryptionString(username!)}
            },
      ));
      // log(response.body as num);
      print(response.data);
    } catch (e) {
      throw e;
    }
  }
}

decryptString(String text) {
  final iv = IV.fromLength(128);
  final key = encrypt.Key.fromUtf8("ghfthgytlkmmgftr");

  final encrypter = Encrypter(AES(key, mode: AESMode.ecb, padding: 'PKCS7'));

  final decrypted = encrypter.decrypt(Encrypted.fromBase64(text), iv: iv);

  return decrypted;
}

String encryptionString(String plainText) {
  final iv = IV.fromLength(128);
  final key = encrypt.Key.fromUtf8("ghfthgytlkmmgftr");

  final encrypter = Encrypter(AES(key, mode: AESMode.ecb, padding: 'PKCS7'));
  final encrypted = encrypter.encrypt(plainText, iv: iv);

  return encrypted.base64;
}
