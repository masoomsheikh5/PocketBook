
import 'package:expensetracker/Theme/AppTheme.dart';
import 'package:expensetracker/Widgets/Custom_Button.dart';
import 'package:expensetracker/Widgets/Custom_Text_Widget.dart';
import 'package:expensetracker/presentation/OnbordingScreen/Controller/OnbordingContoller.dart';
import 'package:expensetracker/routes/App_Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingView extends GetWidget<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       backgroundColor: Colors.white,
        body: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextClass(size: 20, fontWeight: FontWeight.normal, title: "Skip", fontColor: Themecolor.themecolor, fontFamily: ""),
              )
            ],
            ),
            Container(
              height: ScreenSizeConfig.screenHeight *.6,
            
              width: 300,
              child: PageView(
                controller: controller.pageController,
                children: <Widget>[
                  MyPage(
                    image: 'assets/onbording/moneycontrol.jpg',
                    text: 'Gain Total Control \n   Of Your Money',
                    sliderColor: Colors.red,
                  ),
                  MyPage(
                    image: 'assets/onbording/moneygoes.jpg',
                    text: 'Know Where Your \n    Money Goes ',
                    sliderColor: Colors.green,
                  ),
                  MyPage(
                    image: 'assets/onbording/moneyplan.jpg',
                    text: 'Planning Ahead',
                    sliderColor: Colors.blue,
                  ),
                ],
              ),
            ),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildColorCircle(0, controller.currentPage.value),
                buildColorCircle(1, controller.currentPage.value),
                buildColorCircle(2, controller.currentPage.value),
              ],
            )),
            SizedBox(height: 40),

            // CustomButton( title:" Sign Up ",color:Themecolor.themecolor,radius: 25,height:ScreenSizeConfig.screenHeight *.05,width: ScreenSizeConfig.screenWidth *.7, textColor: Colors.white,fontSize: 20, onPressed:(){
             
            // },),
            SizedBox(height: 20),
            
            CustomButton( title:" Login ",color:Color(0xffb9ceed),radius: 25,height:ScreenSizeConfig.screenHeight *.05,width: ScreenSizeConfig.screenWidth *.7, textColor: Colors.white,fontSize: 20, onPressed:(){   Get.offNamed(
        AppRoutes.SignUpScreen,
      );},)
          ],
        ),
      ),
    );
  }

  Widget buildColorCircle(int index, int currentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentPage == index ?  Colors.blue : Colors.grey,
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final String image;
  final String text;
  final Color sliderColor;

  MyPage({required this.image, required this.text, required this.sliderColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(image),
   
       Row(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
           TextClass(title:text,fontColor:Colors.black,fontWeight:FontWeight.bold,size:30,fontFamily:"",),
         ],
       ),
      
      
      ],
    );
  }
}
