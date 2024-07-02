import 'package:get/get.dart';
import 'dart:async';

class VerificationController extends GetxController {
  var otp = ''.obs;
  var timerValue = '04:59'.obs;
  var email = 'brajaoma*****@gmail.com'.obs;
  Timer? _timer;
  int _seconds = 299; // 4 minutes and 59 seconds

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void onOtpChanged(String value) {
    otp.value = value;
  }

  void resendCode() {
    // Logic to resend the code
    _seconds = 299;
    timerValue.value = '04:59';
    startTimer();
  }

  void verifyCode() {
    // Logic to verify the code
  }

  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        _seconds--;
        int minutes = _seconds ~/ 60;
        int seconds = _seconds % 60;
        timerValue.value = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
