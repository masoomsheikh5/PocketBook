import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  late PageController pageController;
  var currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    pageController.addListener(() {
      int page = pageController.page!.round();
      if (page != currentPage.value) {
        currentPage.value = page;
      }
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
