class GetProfileModel {
  bool? isSuccess;
  String? message;
  String? time;
  GetProfileData? data;
  int? responseCode;

  GetProfileModel(
      {this.isSuccess, this.message, this.time, this.data, this.responseCode});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    message = json['Message'];
    time = json['Time'];
    data = json['Data'] != null ? GetProfileData.fromJson(json['Data']) : null;
    responseCode = json['ResponseCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IsSuccess'] = isSuccess;
    data['Message'] = message;
    data['Time'] = time;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['ResponseCode'] = responseCode;
    return data;
  }
}

class GetProfileData {
  int? userId;
  String? emailId;
  String? password;
  String? oldPassword;
  String? firstName;
  String? lastName;
  String? userName;
  String? profilePicPath;
  int? userTypeId;
  String? userTypeName;
  bool? isActive;
  bool? isDeleted;
  bool? isEmailVerified;
  String? createdDate;
  String? createdBy;
  String? updatedDate;
  String? updatedBy;
  String? sProfilePicPath;
  String? token;
  String? clientID;
  String? secretID;
  String? providerID;
  String? providerName;

  GetProfileData(
      {this.userId,
        this.emailId,
        this.password,
        this.oldPassword,
        this.firstName,
        this.lastName,
        this.userName,
        this.profilePicPath,
        this.userTypeId,
        this.userTypeName,
        this.isActive,
        this.isDeleted,
        this.isEmailVerified,
        this.createdDate,
        this.createdBy,
        this.updatedDate,
        this.updatedBy,
        this.sProfilePicPath,
        this.token,
        this.clientID,
        this.secretID,
        this.providerID,
        this.providerName});

  GetProfileData.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    emailId = json['EmailId'];
    password = json['Password'];
    oldPassword = json['OldPassword'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    userName = json['UserName'];
    profilePicPath = json['ProfilePicPath'];
    userTypeId = json['UserTypeId'];
    userTypeName = json['UserTypeName'];
    isActive = json['IsActive'];
    isDeleted = json['IsDeleted'];
    isEmailVerified = json['IsEmailVerified'];
    createdDate = json['CreatedDate'];
    createdBy = json['CreatedBy'];
    updatedDate = json['UpdatedDate'];
    updatedBy = json['UpdatedBy'];
    sProfilePicPath = json['_ProfilePicPath'];
    token = json['Token'];
    clientID = json['ClientID'];
    secretID = json['SecretID'];
    providerID = json['ProviderID'];
    providerName = json['ProviderName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['EmailId'] = emailId;
    data['Password'] = password;
    data['OldPassword'] = oldPassword;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['UserName'] = userName;
    data['ProfilePicPath'] = profilePicPath;
    data['UserTypeId'] = userTypeId;
    data['UserTypeName'] = userTypeName;
    data['IsActive'] = isActive;
    data['IsDeleted'] = isDeleted;
    data['IsEmailVerified'] = isEmailVerified;
    data['CreatedDate'] = createdDate;
    data['CreatedBy'] = createdBy;
    data['UpdatedDate'] = updatedDate;
    data['UpdatedBy'] = updatedBy;
    data['_ProfilePicPath'] = sProfilePicPath;
    data['Token'] = token;
    data['ClientID'] = clientID;
    data['SecretID'] = secretID;
    data['ProviderID'] = providerID;
    data['ProviderName'] = providerName;
    return data;
  }
}
