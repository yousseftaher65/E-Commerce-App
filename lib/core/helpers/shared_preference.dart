import 'package:ecommerce_pojo/config/routes/page_route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static late final SharedPreferences prefs;
  static Future<SharedPreferences> init() async {
    return prefs = await SharedPreferences.getInstance();
  }

  static Future<bool?> saveOnBoarding() async {
    bool res = await prefs.setBool(PageRouteName.onboarding, true);
    return res;
    
  }

  static Future<bool?> getOnBoarding() async {
    return prefs.getBool(PageRouteName.onboarding) ?? false;
  }
}
