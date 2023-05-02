class HotelLoginModel {
  bool? status;
  String? message;
  UserData? data;

  HotelLoginModel.formJson(Map<String, dynamic> json) {
    print(json);

    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.formJson(json['data']) : null;
    // data= UserData.formJson(json['data']);
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserData.formJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}
