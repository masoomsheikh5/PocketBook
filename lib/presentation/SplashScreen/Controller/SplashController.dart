

import 'package:expensetracker/presentation/SplashScreen/Model/SplashModel.dart';
import 'package:expensetracker/routes/App_Routes.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashController extends GetxController {

  Rx<SplashModel> onboardingLaunchModelObj = 
      SplashModel().obs;



  @override
  void onReady() {
   
   checkuser();
  }


 Future<bool> checkIfUserExists(String uid) async {
  User? currentUser = FirebaseAuth.instance.currentUser;
  return currentUser != null && currentUser.uid == uid;
}

checkuser()async{
   SharedPreferences prefs = await SharedPreferences.getInstance();

   String uid=prefs.getString('uid').toString();
  bool userExists = await checkIfUserExists(uid);

if (userExists) {
   Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(
        AppRoutes.TabBarScreen,
      );
    });
  print('User with UID $uid exists in Firebase.');
} else {
   Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(
        AppRoutes.OnbordingScreen,
      );
    });
  print('User with UID $uid does not exist in Firebase.');
}
}

}
