class LoginModel{

  String? phoneNumber;
  String? verificationId;

  LoginModel({this.phoneNumber,this.verificationId});

  Map<String,dynamic> toJson(){
    return {
      'phoneNumber':phoneNumber,
      'verificationId':verificationId,
    };
  }

}