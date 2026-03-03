// import 'package:shared_preferences/shared_preferences.dart';

// abstract class SharedPref {
//   static late SharedPreferences _prefernces;

//   // Keys
//   static String nameKey = "name";
//   static String imageKey = "image";
//   static String isUploadedKey = "isUploaded";

//   // Initialization
//   static Future<void> init() async {
//     _prefernces = await SharedPreferences.getInstance();
//   }

//   static Future<void> setUsertData(String name, String image) async {
//     await setString(nameKey, name);
//     await setString(imageKey, image);
//   }

//   static Future<void> setString(String key, String value) async {
//     await _prefernces.setString(key, value);
//   }

//   static Future<void> setBool(String key, bool value) async {
//     await _prefernces.setBool(key, value);
//   }

//   static Map<String, String> getUsertData() {
//     return {nameKey: getString(nameKey), imageKey: getString(imageKey)};
//   }

//   static String getString(String key) {
//     return _prefernces.getString(key) ?? "";
//   }

//   static bool getBool(String key) {
//     return _prefernces.getBool(key) ?? false;
//   }
// }
