// verification_binding.dart
import 'package:expensetracker/presentation/OtpVerificationScreen/Controller/OtpVerificationController.dart';
import 'package:get/get.dart';


class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationController>(() => VerificationController());
  }
}
