
import 'package:iti_final_project/helpers/shared_preferences.dart';

class Constants {
  static String token = MySharedPreferences.getString('token');
  static bool isFirstTimeToOpenApp =
      MySharedPreferences.getBool('isFirstTimeToOpenApp');
  static String databaseName = 'e-trader.db';
}
