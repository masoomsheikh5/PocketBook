// verification_screen.dart
import 'package:expensetracker/Theme/AppTheme.dart';
import 'package:expensetracker/Widgets/Custom_Button.dart';
import 'package:expensetracker/presentation/OtpVerificationScreen/Controller/OtpVerificationController.dart';
import 'package:expensetracker/presentation/SignUpScreen/Controller/SignUpController.dart';
import 'package:expensetracker/routes/App_Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class VerificationView extends GetWidget<VerificationController> {

  final singupin=Get.find<SignUpController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Verification'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Text(
              'Enter your Verification Code',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            PinCodeTextField(
              appContext: context,
              length: 6,
              onChanged: (value) => controller.onOtpChanged(value),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                fieldHeight: 50,
                fieldWidth: 40,
                activeColor: Colors.black,
                selectedColor: Colors.black,
                inactiveColor: Colors.grey,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Obx(() => Text(
              controller.timerValue.value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )),
            SizedBox(height: 16),
            Text(
              'We send verification code to your phone ${singupin.NumberController.text}. You can check your inbox.',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: controller.resendCode,
              child: Text(
                'I didn’t receive the code? Send again',
                style: TextStyle(
                  color: Colors.purple,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 32),
             CustomButton(
                    title: "Submit",
                    color: Themecolor.themecolor,
                    radius: 25,
                    height: ScreenSizeConfig.screenHeight * .05,
                    width: ScreenSizeConfig.screenWidth * .4,
                    onPressed: () {
      //                  Get.toNamed(
      //   AppRoutes.TabBarScreen,
      // );
 Get.toNamed(
        AppRoutes.TabBarScreen,);
      // singupin.verifyCode(controller.otp.value);
                    },
                    fontSize: 25,
                    textColor: Colors.white),
            // GFButton(
            //   onPressed: controller.verifyCode,
            //   text: 'Verify',
            //   color: GFColors.PRIMARY,
            //   shape: GFButtonShape.pills,
            //   size: GFSize.LARGE,
            // ),
          ],
        ),
      ),
    );
  }
}
