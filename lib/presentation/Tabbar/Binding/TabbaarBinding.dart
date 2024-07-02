import 'package:get/get.dart';
import 'package:expensetracker/presentation/Tabbar/Controller/TabContoller.dart';

class TabBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TabbarController());
  }
}
