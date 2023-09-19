import 'package:get/get.dart';
import 'package:getx/4/model/user_model.dart';
import 'package:getx/4/sevice/api_service.dart';

class UserController extends GetxController{
  var isLoading = true.obs;
  var userList = <UserModel>[].obs;

  fetchUsers() async{
    try{
      isLoading(true);
      var userData = await ApiService().fetchUserData();
      userList.addAll(userData);

    }catch (e){
      print("error fetching users data $e");
    }finally{
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchUsers();
  }
}