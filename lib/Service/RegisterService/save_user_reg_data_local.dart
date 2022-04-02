import 'package:hive/hive.dart';

class RegisterDataSave{

  Future storeTokenRegUserdata(Box? users,String? token,String? id,String? name,String? email,String? role,String? employeId) async{
    print(id);
    users?.put("token", token);
    users?.put("name", name);
    users?.put("email", email);
    users?.put("userId", id);
    users?.put("role", role);
    users?.put("empolyId", employeId);

    print("done");
  }


}