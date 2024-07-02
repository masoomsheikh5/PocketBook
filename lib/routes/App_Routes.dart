import 'package:expensetracker/presentation/Expense/View/ExpanseView.dart';
import 'package:expensetracker/presentation/Expense/binding/ExpenseBinding.dart';
import 'package:expensetracker/presentation/HomeScreen/Binding/HomeBinding.dart';
import 'package:expensetracker/presentation/HomeScreen/view/HomeView.dart';
import 'package:expensetracker/presentation/Income/Binding/IncomeBinding.dart';
import 'package:expensetracker/presentation/Income/View/IncomeView.dart';

import 'package:expensetracker/presentation/OnbordingScreen/binding/onbordingbinding.dart';
import 'package:expensetracker/presentation/OnbordingScreen/view/OnbordingView.dart';
import 'package:expensetracker/presentation/OtpVerificationScreen/Binding/OtpVerificationBinding.dart';
import 'package:expensetracker/presentation/OtpVerificationScreen/View/OtpVerificationView.dart';
import 'package:expensetracker/presentation/SignUpScreen/Binding/SignUpBinding.dart';
import 'package:expensetracker/presentation/SignUpScreen/View/SignUpView.dart';
import 'package:expensetracker/presentation/SplashScreen/View/SplashView.dart';
import 'package:expensetracker/presentation/SplashScreen/binding/SplashBinding.dart';
import 'package:expensetracker/presentation/Tabbar/Binding/TabbaarBinding.dart';
import 'package:expensetracker/presentation/Tabbar/View/Tab_Bar_View.dart';
import 'package:expensetracker/presentation/UserProfileScreen/binding/UserBinding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static const String SplashScreen = "/SplashView";
  static const String OnbordingScreen = "/Onbordingview";
  static const String SignUpScreen = "/SignUpView";
  static const String VerificationScreen = "/VerificationView";
  static const String HomeViewScreen = "/";
  static const String TabBarScreen = "/TabBarview";
  static const String ExpenseScreen = "/ExpenseView";
  static const String IncomeScreen = "/IncomeView";



  static List<GetPage> pages = [
    GetPage(
        name: SplashScreen,
        page: () => SplashView(),
        bindings: [SplashBinding()]),
    GetPage(
        name: OnbordingScreen,
        page: () => OnboardingView(),
        bindings: [OnboardingBinding()]),
    GetPage(
        name: SignUpScreen,
        page: () => SignUpView(),
        bindings: [SignUpBinding()]),
        GetPage(
        name: VerificationScreen,
        page: () => VerificationView(),
        bindings: [VerificationBinding()]),

         GetPage(
        name: HomeViewScreen,
        page: () => HomeView(),
        bindings: [HomeBinding()]),
         GetPage(
        name: TabBarScreen,
        page: () => TabBarView(),
        bindings: [TabBarBinding ()]),

           GetPage(
        name: ExpenseScreen,
        page: () => ExpenseView(),
        bindings: [ExpenseBinding ()]),
         GetPage(
        name: IncomeScreen,
        page: () => IncomeView(),
        bindings: [IncomeBinding ()]),  
       
  ];
}
