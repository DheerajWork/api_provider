import 'package:api_provider/bloc_test/data/repo/post_repo.dart';

class BaseResponse {
  String? statusCode;
  String? statusMessage;

  BaseResponse({this.statusCode, this.statusMessage});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    statusCode = decryptString(json['statusCode']);
    statusMessage = decryptString(json['statusMessage']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['statusMessage'] = statusMessage;
    return data;
  }
}