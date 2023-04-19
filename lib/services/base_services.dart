import 'package:genie/model/general_model.dart';

import '../model/login_master.dart';
import '../model/register_model.dart';
import '../model/social_login_model.dart';

abstract class BaseServices {
  Future<LoginMaster?> login(
      {required String email, required String password, onNoInternet});

  Future<RegisterModel?> register(
      {required String email,
      required String password,
      required String firstName,
      String lastName,
      String userName,
      onNoInternet});

  Future<SocialLoginModel?> socialLogin(
      {required String email,
      required String firstName,
      required String providerID,
      required String providerName,
      required String userName,
      onNoInternet});

  Future<GeneralModel?> forgetPassword({required String email, onNoInternet});

  Future<LoginMaster?> getProfile({required String id, onNoInternet});

  Future<GeneralModel?> updateProfile(
      {required Map<String, String> params,
        required String imagePath,
        onSuccess,
        onFail,
        onNoInternet});

  Future<GeneralModel?> deleteAccount({required String id, onNoInternet});
}
