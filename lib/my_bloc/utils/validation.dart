import 'package:flutter/material.dart';

class Validation {
  static emailValidate(String value, BuildContext context) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value.isEmpty || !regex.hasMatch(value)) {
      return "Enter Email";
    } else {
      return null;
    }
  }

  static phoneValidate(String value , String text) {
    if (value.isEmpty) {
      return "Enter Phone Number";
    } else if (value.length > 10 || value.length <= 8) {
      return "Enter Valid Phone Number";
    }
    return null;
  }

  static customValidation(value, text) {
    if (value == null || value.isEmpty) {
      return "Enter $text";
    }
    return null;
  }
}
