import 'package:genie/views/intro/intro_binding.dart';
import 'package:genie/views/intro/intro_view.dart';
import 'package:genie/views/profile/profile_view.dart';
import 'package:genie/views/register/register_view.dart';
import 'package:get/get.dart';

import '../views/dashboard/dashboard_binding.dart';
import '../views/dashboard/dashboard_view.dart';
import '../views/forgot_password/forget_password_binding.dart';
import '../views/forgot_password/forgot_password_view.dart';
import '../views/home/how_to_use_binding.dart';
import '../views/home/how_to_use_view.dart';
import '../views/keyoard_info/keyboard_info_binding.dart';
import '../views/keyoard_info/keybord_info_view.dart';
import '../views/login/login_binding.dart';
import '../views/login/login_view.dart';
import '../views/profile/edit_profile_binding.dart';
import '../views/profile/edit_profile_view.dart';
import '../views/profile/profile_binding.dart';
import '../views/register/register_binding.dart';
import '../views/splash/splash_binding.dart';
import '../views/splash/splash_view.dart';
import '../views/tutorial/tutorial_binding.dart';
import '../views/tutorial/tutorial_view.dart';
import '../views/upgrade/upgrade_binding.dart';
import '../views/upgrade/upgrade_view.dart';
import '../views/webview/webview_binding.dart';
import '../views/webview/webview_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: Routes.TUTORIAL,
      page: () => TutorialView(),
      binding: TutorialBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashBoardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.EDITPROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: Routes.UPGRADE,
      page: () => const UpgradeView(),
      binding: UpgradeBinding(),
    ),
    GetPage(
      name: Routes.FORGOTPASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: Routes.KEYBOARDINFO,
      page: () => KeyboardInfoView(),
      binding: KeyboardInfoBinding(),
    ),
    GetPage(
      name: Routes.HOWTOUSE,
      page: () => HowToUseView(),
      binding: HowToUseBinding(),
    ),
    GetPage(
      name: Routes.WEBVIEW,
      page: () => WebViewScreen(),
      binding: WebViewBinding(),
    ),
  ];
}
