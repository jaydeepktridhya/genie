import 'login_master.dart';

class RegisterModel {
  String? isSuccess;
  String? message;
  String? time;
  String? registerData;
  int? responseCode;

  RegisterModel(
      {this.isSuccess, this.message, this.time, this.registerData, this.responseCode});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'].toString();
    message = json['Message'];
    time = json['Time'];
    registerData = json['Data'];
    responseCode = json['ResponseCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['Message'] = this.message;
    data['Time'] = this.time;
    data['Data'] = this.registerData;
    data['ResponseCode'] = this.responseCode;
    return data;
  }
}
