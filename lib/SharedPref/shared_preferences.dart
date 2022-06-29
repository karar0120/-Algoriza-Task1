import 'package:shared_preferences/shared_preferences.dart';

class ChasheHelper{
  static late SharedPreferences sharedPreferences;
  static init()async{
    sharedPreferences=await SharedPreferences.getInstance();
  }




  static dynamic getBoolean({required String key}){
   return  sharedPreferences.get(key);
  }

static Future<bool>SaveAllData({
  required key,
  required value,
})async{
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);

    return  await sharedPreferences.setDouble(key, value);
}

static Future<bool>ClearSharedpref({required String key})async{
    return await sharedPreferences.remove(key);
}

}