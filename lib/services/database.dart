import 'package:shared_preferences/shared_preferences.dart';

class dataBaseService{
  static String valueSharedPreference= '';

  static Future<void> saveAuth(value) async{
    SharedPreferences data = await SharedPreferences.getInstance();
    data.setBool("auth", value);
  }

  static Future<bool?> getAuth() async{
    SharedPreferences getData= await SharedPreferences.getInstance();
    return getData.getBool('auth');

  }


}