import 'dart:convert';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:it_work/data/models/user_model.dart';
import 'package:it_work/utils/prefs_helper.dart';
class Constants {
  static String latestVersion = "1.0.6.0";
  static int latestVersionNumber = 1060;
  static int currentVersionNumber = 1050;
  static double currentVersion = 1.5;
  static AdaptiveThemeMode? currentTheme = AdaptiveThemeMode.dark;
  static String? currentLocale = 'ar';

  static UserModel myData(){
    var userMap = Preference.prefs.getString('User');
    UserModel userModel = UserModel.fromJson(jsonDecode(userMap!));
    return userModel;
  }

}

