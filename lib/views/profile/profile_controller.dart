import 'package:firebase_auth/firebase_auth.dart';
import 'package:genie/model/general_model.dart';
import 'package:genie/model/login_master.dart';
import 'package:genie/services/index.dart';
import 'package:genie/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../controller/base_controller.dart';
import '../../database/app_preferences.dart';
import '../../routes/app_pages.dart';
import '../../utils/utility.dart';

class ProfileController extends BaseController {
  AppPreferences appPreferences = AppPreferences();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final Services _services = Services();
  LoginDetails? details = LoginDetails();
  var userName = "".obs;
  var userEmail = "".obs;
  var profilePath = "".obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    details = (await AppPreferences().getLoginDetails())!;
    if (details!.userId != null) {
      getProfileApi(details!.userId.toString());
    }
  }

  Future<void> signOut() async {
    Utility().showProgressBarDialog();
    try {
      final isGoogleSignIn = await googleSignIn.isSignedIn();
      if (isGoogleSignIn) {
        await googleSignIn.signOut();
      }
      await firebaseAuth.signOut();
      appPreferences.isLoggedIn(value: false);
      appPreferences.clearData();
      Get.offNamedUntil(Routes.LOGIN, (route) => false);
    } catch (e) {
      Utility.snackBar('Error signing out. Try again.', Get.context!);
    }
  }

  void getProfileApi(
    String id,
  ) async {
    Utility().showProgressBarDialog();
    LoginMaster? resData = await _services.api!.getProfile(
        id: id,
        onNoInternet: () {
          Utility.snackBar(AppConstants.noInternet, Get.context!);
        });
    Utility().hideProgressBarDialog();
    if (resData!.data != null) {
      userEmail.value = resData.data!.emailId.toString();
      userName.value = resData.data!.firstName.toString();
      profilePath.value = resData.data!.profilePicPath.toString();
    } else {
      Utility.snackBar(AppConstants.somethingWentWrong, Get.context!);
    }
  }

  void deleteAccountApi(
    String id,
  ) async {
    Utility().showProgressBarDialog();
    GeneralModel? resData = await _services.api!.deleteAccount(
        id: id,
        onNoInternet: () {
          Utility.snackBar('No internet connected!', Get.context!);
        });
    Utility().hideProgressBarDialog();
    if (resData != null && resData.responseCode == 200) {
      signOut();
    } else {
      Utility.snackBar("Something went wrong", Get.context!);
    }
  }
}
