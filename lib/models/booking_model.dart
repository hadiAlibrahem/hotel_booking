class BookingModel {
  bool? status;
  String? message;
  BookData? data;

  BookingModel.formJson(Map<String, dynamic> json) {
    print(json);

    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? BookData.formJson(json['data']) : null;
    // data= UserData.formJson(json['data']);
  }
}

class BookData {
  int? id;
  String? name;
  double? price;
  int? rooms ;
  DateTime? startDate ;
  DateTime ?endDate ;
  String? token;

  BookData.formJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    rooms = json['rooms'];
    token = json['token'];
  }
}
