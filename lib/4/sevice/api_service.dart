import 'package:getx/4/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {

  Future<List<UserModel>> fetchUserData() async{
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if(response.statusCode == 200){
      return userModelFromJson(response.body);
    }else {
      throw Exception("network error");
    }
  }

}