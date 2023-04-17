class RegisterModel {
  String? statusCode;
  String? statusMessage;

  RegisterModel({this.statusCode, this.statusMessage});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['statusMessage'] = statusMessage;
    return data;
  }
}