import 'dart:convert';
import 'dart:io';

import 'package:async/src/delegate/stream.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import '../database/app_preferences.dart';
import '../model/general_model.dart';
import '../model/login_master.dart';
import '../model/register_model.dart';
import '../model/social_login_model.dart';
import '../utils/app_constants.dart';
import '../utils/utility.dart';
import 'api_params.dart';
import 'base_services.dart';

class ApiServices extends BaseServices {
  AppPreferences appPreferences = AppPreferences();

  Future<String> getAuthToken() async {
    String token = await appPreferences.getApiToken();
    printf("Auth token: $token");
    return token;
  }

  @override
  Future<LoginMaster?> login(
      {required String email, required String password, onNoInternet}) async {
    if (await Utility.isConnected()) {
      try {
        String getParams() {
          var map = <String, dynamic>{};
          map[ApiParams.email] = email;
          map[ApiParams.password] = password;
          printf("Login Parameter: ${json.encode(map)}");
          return json.encode(map);
        }

        Uri uri = Uri.parse(AppConstants.loginApiUrl);
        final http.Response response = await http.post(
          uri,
          body: getParams(),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
        );
        printf("Headers :${response.headers}");
        printf("URL :${response.request!.url}");
        printf("Response :${response.body}");
        return LoginMaster.fromJson(json.decode(response.body));
      } catch (err) {
        printf("Error: $err");
        return null;
      }
    } else {
      if (onNoInternet != null) onNoInternet();
      return null;
    }
  }

  @override
  Future<RegisterModel?> register(
      {required String email,
      required String password,
      required String firstName,
      String? lastName,
      String? userName,
      onNoInternet}) async {
    if (await Utility.isConnected()) {
      try {
        String getParams() {
          var map = <String, dynamic>{};
          map[ApiParams.email] = email;
          map[ApiParams.password] = password;
          map[ApiParams.firstName] = firstName;
          map[ApiParams.lastName] = "";
          map[ApiParams.userName] = "";
          printf("Register Parameter: ${json.encode(map)}");
          return json.encode(map);
        }

        Uri uri = Uri.parse(AppConstants.registerApiUrl);
        final http.Response response = await http.post(
          uri,
          body: getParams(),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
        );
        printf("Headers :${response.headers}");
        printf("URL :${response.request!.url}");
        printf("Response :${response.body}");
        return RegisterModel.fromJson(json.decode(response.body));
      } catch (err) {
        printf("Error: $err");
        return null;
      }
    } else {
      if (onNoInternet != null) onNoInternet();
      return null;
    }
  }

  @override
  Future<SocialLoginModel?> socialLogin(
      {required String email,
      required String firstName,
      required String providerID,
      required String providerName,
      required String userName,
      onNoInternet}) async {
    if (await Utility.isConnected()) {
      try {
        String getParams() {
          var map = <String, dynamic>{};
          map[ApiParams.email] = email;
          map[ApiParams.firstName] = firstName;
          map[ApiParams.providerID] = providerID;
          map[ApiParams.providerName] = providerName;
          map[ApiParams.userName] = userName;
          map[ApiParams.clientID] = ApiParams.clientIDVal;
          map[ApiParams.secretID] = ApiParams.secretIDVal;
          printf("Social Login Parameter: ${json.encode(map)}");
          return json.encode(map);
        }

        Uri uri = Uri.parse(AppConstants.socialLoginApiUrl);
        final http.Response response = await http.post(
          uri,
          body: getParams(),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
        );
        printf("Headers :${response.headers}");
        printf("URL :${response.request!.url}");
        printf("Response :${response.body}");
        return SocialLoginModel.fromJson(json.decode(response.body));
      } catch (err) {
        printf("Error: $err");
        return null;
      }
    } else {
      if (onNoInternet != null) onNoInternet();
      return null;
    }
  }

  @override
  Future<GeneralModel?> forgetPassword(
      {required String email, onNoInternet}) async {
    if (await Utility.isConnected()) {
      try {
        String getParams() {
          var map = <String, dynamic>{};
          map[ApiParams.email] = email;
          printf("Parameter: ${json.encode(map)}");
          return json.encode(map);
        }

        Uri uri = Uri.parse(AppConstants.forgetPasswordApiUrl);
        final http.Response response = await http.post(
          uri,
          body: getParams(),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
        );
        printf("Headers :${response.headers}");
        printf("URL :${response.request!.url}");
        printf("Response :${response.body}");
        return GeneralModel.fromJson(json.decode(response.body));
      } catch (err) {
        printf("Error: $err");
        return null;
      }
    } else {
      if (onNoInternet != null) onNoInternet();
      return null;
    }
  }

  @override
  Future<LoginMaster?> getProfile({required String id, onNoInternet}) async {
    if (await Utility.isConnected()) {
      try {
        Uri uri = Uri.parse(AppConstants.getProfileApiUrl + id);
        final http.Response response = await http.get(
          uri,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
        );
        printf("Headers :${response.headers}");
        printf("URL :${response.request!.url}");
        printf("Response :${response.body}");
        return LoginMaster.fromJson(json.decode(response.body));
      } catch (err) {
        printf("Error: $err");
        return null;
      }
    } else {
      if (onNoInternet != null) onNoInternet();
      return null;
    }
  }

  @override
  Future<GeneralModel?> updateProfile(
      {required Map<String, String> params,
      required String imagePath,
      onSuccess,
      onFail,
      onNoInternet}) async {
    if (await Utility.isConnected()) {
      final request = http.MultipartRequest(
        "post",
        Uri.parse(AppConstants.updateProfileApiUrl),
      );
      if (imagePath.isNotEmpty) {
        try {
          File docFile = File(imagePath);
          var stream =
              http.ByteStream(DelegatingStream.typed(docFile.openRead()));
          var length = await docFile.length();
          var multipartFile = http.MultipartFile(
              ApiParams.profilePic, stream, length,
              filename: basename(docFile.path));
          request.files.add(multipartFile);
          printf("File: $imagePath");
          int sizeInBytes = docFile.lengthSync();
          double sizeInMb = sizeInBytes / (1024 * 1024);
          printf("Size in Mb: $sizeInMb");
        } catch (e) {
          printf(e);
        }
      }
      request.headers.addAll({
        "Accept": "application/json",
        "Content-Type": "application/json",
      });
      request.fields.addAll(params);
      request.send().then((response) {
        printf("Headers :${request.headers}");
        printf("URL: ${response.request!.url}");
        printf("Response: ${response}");
        response.stream.transform(utf8.decoder).listen((value) {
          try {
            printf("Response: $value");
            if (response.statusCode == 200) {
              GeneralModel model = GeneralModel.fromJson(json.decode(value));
              onSuccess(model);
            } else {
            }
          } catch (e) {
            debugPrint("Error: ${e.toString()}");
          }
        });
      });
    } else {
      if (onNoInternet != null) onNoInternet();
      return GeneralModel();
    }
    return GeneralModel();
  }

  @override
  Future<GeneralModel?> deleteAccount(
      {required String id, onNoInternet}) async {
    if (await Utility.isConnected()) {
      try {
        Uri uri = Uri.parse(AppConstants.deleteAccountApiUrl + id);
        final http.Response response = await http.get(
          uri,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
        );
        printf("Headers :${response.headers}");
        printf("URL :${response.request!.url}");
        printf("Response :${response.body}");
        return GeneralModel.fromJson(json.decode(response.body));
      } catch (err) {
        printf("Error: $err");
        return null;
      }
    } else {
      if (onNoInternet != null) onNoInternet();
      return null;
    }
  }
}
