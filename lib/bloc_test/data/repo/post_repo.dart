import 'dart:math';

import 'package:api_provider/bloc_test/data/api/api.dart';
import 'package:encrypt/encrypt.dart'as encrypt;
import 'package:encrypt/encrypt.dart';
import 'package:http/http.dart';

class PostRepo{

  API api = API();

  void fetchPosts() async{
    try{
      Response response = (await api.sendRequest.get("api/v1/driverUserRegister",
        // data: {
        //   "mobileCredentials": {
        //     "username": "sBw28NJNgmD3R6qt3tzewQ==",
        //     "password": "oINnHsfJRmXHnaFML+ITZw==",
        //     "deviceType": "Lt6pJoQQtI8mc8tJhmEpSg==",
        //     "deviceId": "PDaH0I6wXk2+0mrovDcY3dM3kAwrmzT2ttlV5fImLJg=",
        //     "appVersion": "1e2hD0yZ34pWNJA9DbvZFA=="
        //   },
        //   "user": {
        //     "username": "TqAqKjtY2h2eLeDHwfWYFA=="
        //   },
        //   "customerDetails": {
        //     "fullName": "yaEiNIFZeQg/TBgYtKO1NMrSeeeZ6CZdExibmQMnMOM==",
        //     "email": "QCPCiA6LhQ318dn0PkUT6Q==",
        //     "gender": "dbk1zdqbWr6Op/X/7NTfYg==",
        //     "fcmToken": "dsfsdgdrgree/hgfHGdhgf/hgjdjgfdterw/=="
        //   }
        // },
      )) as Response;
      log(response.body as num);
    } catch(e){
      throw e;
    }
  }

}


String encryptionString(String plainText) {
  final iv = IV.fromLength(128);
  final key = encrypt.Key.fromUtf8("ghfthgytlkmmgftr");

  final encrypter = Encrypter(AES(key, mode: AESMode.ecb, padding: 'PKCS7'));
  final encrypted = encrypter.encrypt(plainText, iv: iv);

  return encrypted.base64;
}