class Todo {
  int? addressId;
  String? userId;
  bool? defaultAddress;
  String? name;
  String? nickName;
  String? companyName;
  String? phoneNo;
  String? alternatePhoneno;
  String? zipcode;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? createdAt;

  Todo(
      {this.addressId,
        this.userId,
        this.defaultAddress,
        this.name,
        this.nickName,
        this.companyName,
        this.phoneNo,
        this.alternatePhoneno,
        this.zipcode,
        this.addressLine1,
        this.addressLine2,
        this.city,
        this.state,
        this.createdAt});

  Todo.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    userId = json['user_id'];
    defaultAddress = json['default_address'];
    name = json['name'];
    nickName = json['nick_name'];
    companyName = json['company_name'];
    phoneNo = json['phone_no'];
    alternatePhoneno = json['alternate_phoneno'];
    zipcode = json['zipcode'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    city = json['city'];
    state = json['state'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['user_id'] = userId;
    data['default_address'] = defaultAddress;
    data['name'] = name;
    data['nick_name'] = nickName;
    data['company_name'] = companyName;
    data['phone_no'] = phoneNo;
    data['alternate_phoneno'] = alternatePhoneno;
    data['zipcode'] = zipcode;
    data['address_line_1'] = addressLine1;
    data['address_line_2'] = addressLine2;
    data['city'] = city;
    data['state'] = state;
    data['created_at'] = createdAt;
    return data;
  }
}