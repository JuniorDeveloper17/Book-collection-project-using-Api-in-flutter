import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_msib1/auth/view/login.dart';
import 'package:test_msib1/core/dependency/dependency.dart';
import '../../navigation/view/navigation.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    cekStatus();
  }

  Future cekStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = await preferences.getString('token');
    Future.delayed(Duration(seconds: 3), () async {
      if (token != null) {
        await profile.tokens(token);
        await profile.getUserData();
        Get.offAll(() => NavigationView());
      } else {
        Get.offAll(() => LoginView());
      }
    });
  }
}
