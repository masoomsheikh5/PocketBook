import 'package:expensetracker/Theme/AppTheme.dart';
import 'package:expensetracker/presentation/Tabbar/Controller/TabContoller.dart';
import 'package:expensetracker/routes/App_Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPositionedContainer extends StatelessWidget {
  final controller=Get.find<TabbarController>();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: ScreenSizeConfig.screenHeight * .7,
    // Center horizontally
      child: Container(
        width: ScreenSizeConfig.screenWidth,
        height: ScreenSizeConfig.screenHeight * .2,
        decoration: BoxDecoration(
          color:Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              InkWell(
                onTap: (){
                  controller.isCreateEntry.value=false;
                       Get.toNamed(
        AppRoutes.IncomeScreen,
      );
                },
                child: CircleAvatar(radius: 30,backgroundColor: Colors.green,
                child: Column(children: [
                  SizedBox(height: 5,),
                  Icon(Icons.arrow_downward,color: Colors.white,),
                  Icon(Icons.photo_camera,color: Colors.white,)
                
                ],),
                ),
              ),
              SizedBox(width: ScreenSizeConfig.screenWidth*.2,),
            InkWell(
                onTap: (){
                  controller.isCreateEntry.value=false;

                       Get.toNamed(
        AppRoutes.ExpenseScreen,
      );
                },
                child: CircleAvatar(radius: 30,backgroundColor: Colors.red,  child: Column(children: [
                  SizedBox(height: 5,),
                  Icon(Icons.arrow_upward,color: Colors.white,),
                  Icon(Icons.photo_camera,color: Colors.white,)
                
                ],),),
              )
            ],)
          ],
        ),
      ),
    );
  }
}


