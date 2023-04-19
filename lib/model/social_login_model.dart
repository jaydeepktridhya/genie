import 'package:genie/model/login_master.dart';

class SocialLoginModel {
  String? isSuccess;
  String? message;
  String? time;
  LoginDetails? data;
  int? responseCode;

  SocialLoginModel(
      {this.isSuccess, this.message, this.time, this.data, this.responseCode});

  SocialLoginModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'].toString();
    message = json['Message'];
    time = json['Time'];
    data = json['Data'] != null ? new LoginDetails.fromJson(json['Data']) : null;
    responseCode = json['ResponseCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['Message'] = this.message;
    data['Time'] = this.time;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['ResponseCode'] = this.responseCode;
    return data;
  }
}

