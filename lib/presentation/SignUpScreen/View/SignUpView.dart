import 'package:expensetracker/Theme/AppTheme.dart';
import 'package:expensetracker/Widgets/Custom_Button.dart';
import 'package:expensetracker/Widgets/customTextformfield.dart';
import 'package:expensetracker/routes/App_Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/SignUpController.dart';

class SignUpView extends GetWidget<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('Sign Up'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: Container(
        height: ScreenSizeConfig.screenHeight,
        width: ScreenSizeConfig.screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16),
                Container(
                  height: ScreenSizeConfig.screenHeight * .3,
                  width: ScreenSizeConfig.screenWidth * .7,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/onbording/moneycontrol.jpg"))),
                ),
                CustomTextField(
                  label: "Phone",
                  controllerValue: controller.NumberController,
                  inputType: TextInputType.phone,
                ),
                SizedBox(height: 16),
                CustomButton(
                    title: "Next",
                    color: Themecolor.themecolor,
                    radius: 25,
                    height: ScreenSizeConfig.screenHeight * .05,
                    width: ScreenSizeConfig.screenWidth * .7,
                    onPressed: () {

      controller.sendVerificationCode();
                    },
                    fontSize: 25,
                    textColor: Colors.white),
                SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(width: 8),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: 'By signing up, you agree to the ',
                          children: [
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: ' and ',
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                // SizedBox(height: 16),
                // Row(
                //   children: [
                //     Expanded(
                //       child: Divider(),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //       child: Text('Or with'),
                //     ),
                //     Expanded(
                //       child: Divider(),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 16),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
