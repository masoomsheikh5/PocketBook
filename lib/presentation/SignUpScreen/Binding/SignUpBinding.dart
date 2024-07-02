import 'package:expensetracker/presentation/SignUpScreen/Controller/SignUpController.dart';
import 'package:get/get.dart';


class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
