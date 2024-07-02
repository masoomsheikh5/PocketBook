import 'package:expensetracker/Theme/AppTheme.dart';
import 'package:expensetracker/presentation/SplashScreen/Controller/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends GetWidget<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
     ScreenSizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: ScreenSizeConfig.screenHeight,
        width:  ScreenSizeConfig.screenWidth,
        color: Color(0xff7F00FF),
        child: Center(
          child: Text(
            "PocketBook",
            style:  GoogleFonts.sahitya (color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold ),
          ),
        ),
      ),
    ));
  }
}
