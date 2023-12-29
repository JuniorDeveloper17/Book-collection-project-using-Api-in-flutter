import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:test_msib1/auth/controller/auth-controller.dart';
import 'package:test_msib1/home/controller/home-controller.dart';
import 'package:test_msib1/management/controller/management-controller.dart';
import 'package:test_msib1/navigation/controller/navigation-controller.dart';
import 'package:test_msib1/profile/controller/profile-controller.dart';
import 'package:test_msib1/splashscreen/controller/splash-controller.dart';

final auth = Get.put(AuthController());
final home = Get.put(HomeController());
final splash = Get.put(SplashController());
final nav = Get.put(NavigationController());
final management = Get.put(ManagementController());
final profile = Get.put(ProfileController(), permanent: true);
