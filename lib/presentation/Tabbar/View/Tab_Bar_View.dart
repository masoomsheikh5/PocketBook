import 'package:expensetracker/Theme/AppTheme.dart';
import 'package:expensetracker/Utils/Image_Constant.dart';

import 'package:expensetracker/Widgets/CustomImageView.dart';
import 'package:expensetracker/Widgets/Custom_createBox.dart';
import 'package:expensetracker/presentation/Budgetscreen/View/BudgetView.dart';
import 'package:expensetracker/presentation/HomeScreen/view/HomeView.dart';
import 'package:expensetracker/presentation/Tabbar/Controller/TabContoller.dart';
import 'package:expensetracker/presentation/Tabbar/Model/BottomMenuModel.dart';
import 'package:expensetracker/presentation/TransactionScreen/View/TansactionnView.dart';
import 'package:expensetracker/presentation/UserProfileScreen/view/UserProfieView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarView extends GetWidget<TabbarController> {
  TabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() =>  Stack(children: [
        controller.getPage(controller.bottomIndex.value),
     if(controller.isCreateEntry.value==true)   CustomPositionedContainer(),
        ]),
      ), 
      bottomNavigationBar: buildBottomAppBar(),
     floatingActionButton: Obx(
       (){

       return FloatingActionButton(
          onPressed: () {
       controller.isCreateEntry.value=!controller.isCreateEntry.value;
       
          },
          child:controller.isCreateEntry.value==false? Icon(Icons.add, color: Colors.white):Icon(Icons.cancel, color: Colors.white),
          backgroundColor:Themecolor.themecolor , // Choose your preferred color
          shape: CircleBorder(), // Ensures the FAB is circular
        );}
     ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
    );
  }

  buildBottomAppBar() {
    return Obx(() => BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(bottomMenuList.length + 1, (index) {
          if (index == bottomMenuList.length ~/ 2) {
            return SizedBox(width: 48); // Empty space for the FAB
          }
          final menu = bottomMenuList[index > bottomMenuList.length ~/ 2 ? index - 1 : index];
          return IconButton(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: controller.bottomIndex.value == index ? menu.activeIcon : menu.icon,
                  height: 24,
                  width: 24,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(
                    menu.title ?? "",
                    style: TextStyle(
                      color: controller.bottomIndex.value == index ?Themecolor.themecolor: Colors.black,fontSize: 10
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () => controller.bottomIndex.value = index,
          );
        }),
      ),
    ));
  }

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.HomeIconInactive,
      activeIcon: ImageConstant.HomeIconactive,
      title: "Home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.TacsactionIconInactive,
      activeIcon: ImageConstant.TacsactionIconactive,
      title: "Transaction".tr,
      type: BottomBarEnum.Tansaction,
    ),
    BottomMenuModel(
      icon: ImageConstant.BudgetIconInactive,
      activeIcon: ImageConstant.BudgetIconactive,
      type: BottomBarEnum.Budget,
      title: "Budget".tr,
    ),
    BottomMenuModel(
      icon: ImageConstant.ProfileIconInactive,
      activeIcon: ImageConstant.ProfileIconactive,
      title: "Profile".tr,
      type: BottomBarEnum.Profile,
    ),
  ];

  // var routes = [
  //   Get.lazyPut(() => HomeView()),
  //   Get.lazyPut(() => TransactionnView()),
  //   Get.lazyPut(() => BudgetView()),
  //   Get.lazyPut(() => UserProfileView()),
  // ];
}

class AddNewItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Item"),
      ),
      body: Center(
        child: Text("Add new item here"),
      ),
    );
  }
}
