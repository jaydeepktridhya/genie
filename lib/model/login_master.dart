class LoginMaster {
  String? isSuccess;
  String? message;
  String? time;
  LoginDetails? data;
  int? responseCode;

  LoginMaster(
      {this.isSuccess, this.message, this.time, this.data, this.responseCode});

  LoginMaster.fromJson(Map<String, dynamic> json) {
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

class LoginDetails {
  int? userId;
  String? emailId;
  String? firstName;
  String? lastName;
  String? userName;
  String? profilePicPath;
  int? userTypeId;
  bool? isActive;
  bool? isEmailVerified;
  String? createdDate;
  String? token;

  LoginDetails(
      {this.userId,
        this.emailId,
        this.firstName,
        this.lastName,
        this.userName,
        this.profilePicPath,
        this.userTypeId,
        this.isActive,
        this.isEmailVerified,
        this.createdDate,
        this.token});

  LoginDetails.fromJson(Map<String, dynamic> json) {
    userId = json['UserId']??0;
    emailId = json['EmailId'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    userName = json['UserName'];
    profilePicPath = json['ProfilePicPath'];
    userTypeId = json['UserTypeId'];
    isActive = json['IsActive'];
    isEmailVerified = json['IsEmailVerified'];
    createdDate = json['CreatedDate'];
    token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['EmailId'] = this.emailId;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['UserName'] = this.userName;
    data['ProfilePicPath'] = this.profilePicPath;
    data['UserTypeId'] = this.userTypeId;
    data['IsActive'] = this.isActive;
    data['IsEmailVerified'] = this.isEmailVerified;
    data['CreatedDate'] = this.createdDate;
    data['Token'] = this.token;
    return data;
  }
}
