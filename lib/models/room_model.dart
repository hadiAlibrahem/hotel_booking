class RoomModel{
  int id=0;
  String type='';
  dynamic price;
  List<String> images=[];
  String discription='';
  bool? isfavorites;
  bool inCart=true;
  RoomModel(
      this.id,
      this.type,
      this.price,
      this.images, this.discription, this.isfavorites, this.inCart
      );

  RoomModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    type=json['type'];
    price=json['price'];
   // images=json['image'];
    discription=json['name'];
    isfavorites=json['is_favorited'];
    inCart=json['in_cart'];
    json['images'].forEach((element)
    {
      images.add((element));
    });
  }
}