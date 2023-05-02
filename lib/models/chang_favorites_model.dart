class changeFavoritesModel{
  bool ?status;
  String? message;
  changeFavoritesModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    message=json['message'];
  }
}