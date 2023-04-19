import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:genie/controller/base_controller.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../database/app_preferences.dart';
import '../../generated/i18n.dart';
import '../../model/register_model.dart';
import '../../model/social_login_model.dart';
import '../../routes/app_pages.dart';
import '../../services/api_params.dart';
import '../../services/index.dart';
import '../../utils/utility.dart';
import '../../utils/validations.dart';

class RegisterController extends BaseController {
  Services _services = Services();
  AppPreferences appPreferences = AppPreferences();
  TextEditingController nameCtl = TextEditingController();
  FocusNode nameFn = FocusNode();

  TextEditingController emailCtl = TextEditingController();
  FocusNode emailFn = FocusNode();

  TextEditingController passwordCtl = TextEditingController();
  FocusNode passwordFn = FocusNode();

  TextEditingController passwordRepeatCtl = TextEditingController();
  FocusNode passwordRepeatFn = FocusNode();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _userObj;
  UserCredential? userCredential;
  String displayName = "";
  String email = "";

  var isVisiblePwd = true.obs;
  var isVisibleConfirmPwd = true.obs;
  var appleId;

  bool validate() {
    if (nameCtl.text.isEmpty) {
      Utility.snackBar(ValidationConstants.emptyName, Get.context!);
      return false;
    }
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
    if (passwordRepeatCtl.text.isEmpty) {
      Utility.snackBar(ValidationConstants.emptyRepeatPassword, Get.context!);
      return false;
    }
    if (passwordCtl.text != passwordRepeatCtl.text) {
      Utility.snackBar(ValidationConstants.matchPassword, Get.context!);
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
      socialLoginApi(
        _userObj!.email,
        displayName,
        _userObj!.id,
        "",
        _userObj!.displayName ?? "",true
      );
    }).catchError((e) {
      email = e.toString();
      printf(e.toString());
    });
  }

  Future<void> appleSignInMethod() async {
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

      socialLoginApi(email, fullName.trim(), appleId ?? "", ApiParams.apple,
          appleIdCredential.givenName ?? "",false);
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

  void registerAPI(String email, String password, String firstName,
      String lastName, String userName) async {
    Utility().showProgressBarDialog();
    RegisterModel? registerModel = await _services.api!.register(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        onNoInternet: () {
          Utility.snackBar(S.of(Get.context!)!.noInternet, Get.context!);
        });

    Utility().hideProgressBarDialog();
    if (registerModel != null) {
      if (registerModel.registerData != null) {
        printf("request===========${registerModel.registerData}");
        Get.offNamedUntil(
          Routes.LOGIN,
          (route) => false,
        );
      }
      Utility.snackBar(registerModel.message ?? "", Get.context!);
    } else {
      Utility.snackBar('Enter valid email', Get.context!);
    }
  }

  void socialLoginApi(
    String email,
    String firstName,
    String googleID,
    String appleID,
    String userName, bool isForGoogle,
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
}
