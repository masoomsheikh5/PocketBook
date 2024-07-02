import 'package:expensetracker/presentation/SplashScreen/Controller/SplashController.dart';
import 'package:get/get.dart';



class SplashBinding extends Bindings {
 @override
  void dependencies() {
   Get.lazyPut(() => SplashController());
 }
}