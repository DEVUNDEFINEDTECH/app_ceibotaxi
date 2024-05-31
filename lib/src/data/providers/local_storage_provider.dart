import 'package:app_taxis/src/data/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final String _token = 'TOKEN';
  final String _userName = 'USERNAME';
  GetStorage local_storage = GetStorage();

  @override
  Future<void> clearData() async {
    await local_storage.remove(_token);
    //await local_storage.remove(_userName);
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //sharedPreferences.clear();
  }

  @override
  Future<String?> getToken() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return local_storage.read(_token); //sharedPreferences.getString(_token)!;
  }

  @override
  Future<User> getUser() async {
    throw UnimplementedError();
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // final User user = User(
    //   username: await local_storage.read(_userName),
    //   //token: await local_storage.read(_token)
    //   //userName: sharedPreferences.get(_userName),
    //   //token: sharedPreferences.get(_token),
    // );
    //return user;
  }

  @override
  Future<void> saveToken(String token) async {
    await local_storage.write(_token, token);
  }

  @override
  Future<bool> saveUser(User user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}
