import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:genie/controller/base_controller.dart';
import 'package:genie/services/api_params.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../database/app_preferences.dart';
import '../../generated/i18n.dart';
import '../../model/login_master.dart';
import '../../model/social_login_model.dart';
import '../../routes/app_pages.dart';
import '../../services/index.dart';
import '../../utils/utility.dart';
import '../../utils/validations.dart';

class LoginController extends BaseController {
  AppPreferences appPreferences = AppPreferences();
  final Services _services = Services();
  TextEditingController emailCtl = TextEditingController();
  FocusNode emailFn = FocusNode();

  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _userObj;
  UserCredential? userCredential;
  String displayName = "";
  String email = "";
  var isChecked = false.obs;
  var isVisiblePwd = true.obs;
  var rememberMe = false;
  var appleId;

  @override
  void onInit() {
    // loadUserEmailPassword();
    super.onInit();
  }

  bool validate() {
    if (emailCtl.text.isEmpty) {
      Utility.snackBar(ValidationConstants.emptyEmail, Get.context!);
      return false;
    }
    if (!GetUtils.isEmail(emailCtl.text)) {
      Utility.snackBar(ValidationConstants.validEmail, Get.context!);
      return false;
    }
    if (passwordCtl.text.isEmpty) {
      Utility.snackBar(ValidationConstants.emptyPassword, Get.context!);
      return false;
    }
    return true;
  }

  Future<void> googleSignInMethod() async {
    await _googleSignIn.signIn().then((userData) async {
      _userObj = userData;
      printf(_userObj.toString());
      email = _userObj!.email;
      displayName = _userObj!.displayName.toString();
      printf('Email : $email');
      printf('Name : $displayName');

      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        printf("current user data======>$_userObj");

        final googleAuth = await _userObj!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);
      }
      socialLoginApi(_userObj!.email, displayName, _userObj!.id, "",
          _userObj!.displayName ?? "", true);
    }).catchError((e) {
      email = e.toString();
      printf(e.toString());
    });
  }

  Future<void> appleSignInMethod() async {
    printf('Apple sign in called');
    try {
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);
      final appleIdCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );
      printf(appleIdCredential.toString());
      printf(appleIdCredential.userIdentifier);
      printf(appleIdCredential.familyName);
      printf(appleIdCredential.givenName);
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleIdCredential.identityToken,
        rawNonce: rawNonce,
      );
      printf("oauthCredential---$oauthCredential");
      String email = appleIdCredential.email ?? "";
      String fullName =
          '${appleIdCredential.givenName ?? ""} ${appleIdCredential.familyName ?? ""}';
      var result =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      printf("result---${result.user}");
      printf(result.user?.email);
      appleId = appleIdCredential.userIdentifier;
      printf("appleId" + appleId);
      final firebaseUser = result.user;
      printf(displayName);
      await firebaseUser!.updateDisplayName(displayName);

      socialLoginApi(email, fullName.trim(), "", appleId,
          appleIdCredential.givenName ?? "", false);
    } catch (e) {
      printf('apple sign in error: ${e.toString()}');
    }
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  void loginAPI(String email, String password) async {
    Utility().showProgressBarDialog();
    LoginMaster? master = await _services.api!.login(
        email: email,
        password: password,
        onNoInternet: () {
          Utility.snackBar(S.of(Get.context!)!.noInternet, Get.context!);
        });

    Utility().hideProgressBarDialog();
    if (master != null) {
      if (master.data != null) {
        appPreferences.setLoginDetails(json.encode(master.data!.toJson()));
        appPreferences.saveApiToken(value: master.data!.token!.toString());
        appPreferences.isLoggedIn(value: true);
        appPreferences.getLoginDetails();
        printf("request===========${master.data.toString()}");
        Get.offNamedUntil(Routes.DASHBOARD, (route) => false, arguments: {
          "fullName": master.data!.firstName.toString(),
          "email": master.data!.emailId.toString(),
          "profilePicPath": master.data!.profilePicPath.toString()
        });
      }
      Utility.snackBar(master.message ?? "", Get.context!);
    } else {
      Utility.snackBar('Enter valid email', Get.context!);
    }
  }

  void socialLoginApi(
    String email,
    String firstName,
    String googleID,
    String appleID,
    String userName,
    bool isForGoogle,
  ) async {
    Utility().showProgressBarDialog();
    SocialLoginModel? socialLoginData = await _services.api!.socialLogin(
        email: email,
        firstName: firstName,
        providerID: isForGoogle ? googleID : appleID,
        providerName: isForGoogle ? ApiParams.google : ApiParams.apple,
        userName: userName,
        onNoInternet: () {
          Utility.snackBar('No internet connected!', Get.context!);
        });
    Utility().hideProgressBarDialog();
    if (socialLoginData != null && socialLoginData.responseCode == 200) {
      await appPreferences
          .setLoginDetails(json.encode(socialLoginData.data!.toJson()));
      await appPreferences.saveApiToken(value: socialLoginData.data?.token);
      await appPreferences.isLoggedIn(value: true);
      Get.offNamedUntil(Routes.DASHBOARD, (route) => false);
    } else {
      Utility.snackBar("Something went wrong", Get.context!);
    }
  }

  toggleRemember() {
    isChecked.value = !isChecked.value;
    printf("Remember me is ${isChecked.value}");
  }

  handleRememberMe() async {
    if (isChecked.value) {
      appPreferences.setString(AppPreferences.keyEmail, emailCtl.text);
      appPreferences.setString(AppPreferences.keyPassword, passwordCtl.text);
    } else {
      appPreferences.setString(AppPreferences.keyEmail, "");
      appPreferences.setString(AppPreferences.keyPassword, "");
    }
    appPreferences.setBool(AppPreferences.keyRememberMe, isChecked.value);
    // isChecked.value = value ?? false;
    printf("Credentials saved locally");
  }

  void loadUserEmailPassword() async {
    printf("Load Email");
    try {
      var email = await appPreferences.getString(key: AppPreferences.keyEmail);
      var password =
          await appPreferences.getString(key: AppPreferences.keyPassword);
      rememberMe =
          (await appPreferences.getBool(key: AppPreferences.keyRememberMe))!;

      printf(rememberMe);
      printf(email);
      printf(password);
      if (rememberMe) {
        emailCtl.text = email ?? "";
        passwordCtl.text = password ?? "";
        isChecked.value = rememberMe;
      }
    } catch (e) {
      printf(e);
    }
  }
}
