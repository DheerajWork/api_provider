import 'dart:convert';
import 'package:api_provider/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoService{
  Future<List<Todo>> getAll() async{
    const url = 'http://testapi.sojo.com.my/api/address/get_by_user.php';
    final uri = Uri.parse(url);
    final response = await http.get(uri,headers: {
      "user_id" :"5",
        "firebaseId" :"2Ck9tdlIDvRP1heGcS0MjdtXQoJ2"
    });
    if(response.statusCode==200){
      final json = jsonDecode(response.body);
      final todos = json.map((e){
        return Todo(
          addressId: e['address_id'],
          userId: e['user_id'],
          defaultAddress: e['default_address'],
          name: e['name'],
          nickName: e['nick_name'],
          companyName: e['company_name'],
          phoneNo: e['phone_no'],
          alternatePhoneno: e['alternate_phoneno'],
          zipcode: e['zipcode'],
          addressLine1: e['address_line_1'],
          addressLine2: e['address_line_2'],
          city: e['city'],
          state: e['state'],
          createdAt: e['created_at'],
        );
      }).toList();
      return todos;
    }
    return [];
    // throw "Something went wrong";
  }

}