import 'package:get/get.dart';
import 'package:test_msib1/home/view/home.dart';
import 'package:test_msib1/management/view/management.dart';
import 'package:test_msib1/profile/view/profile.dart';

class NavigationController extends GetxController {
  RxInt pageIndex = 0.obs;
  List pageWidget = [HomeView(),ManagementView(), ProfileView()].obs;
}
