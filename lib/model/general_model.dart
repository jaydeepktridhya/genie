class GeneralModel {
  bool? isSuccess;
  String? message;
  String? time;
  String? data;
  int? responseCode;

  GeneralModel(
      {this.isSuccess, this.message, this.time, this.data, this.responseCode});

  GeneralModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    message = json['Message'];
    time = json['Time'];
    data = json['Data'];
    responseCode = json['ResponseCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IsSuccess'] = isSuccess;
    data['Message'] = message;
    data['Time'] = time;
    data['Data'] = this.data;
    data['ResponseCode'] = responseCode;
    return data;
  }
}
