import 'package:expensetracker/presentation/OnbordingScreen/Controller/OnbordingContoller.dart';

import 'package:get/get.dart';



class OnboardingBinding extends Bindings {
 @override
  void dependencies() {
   Get.lazyPut(() => OnboardingController());
 }
}