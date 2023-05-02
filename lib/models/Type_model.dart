
class TypeRoomModel{
  int ? id;
  HomeDataRoom ? data;
  TypeRoomModel.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    data=HomeDataRoom.fromJson(json['data']);
  }
}
class HomeDataRoom {

  List<ItemRoomModel>room = [];

  HomeDataRoom.fromJson(Map<String, dynamic>json){
    json['room'].forEach((element) {
      room.add(ItemRoomModel.fromJson(element));
    });
  }
}


class ItemRoomModel{

  int id=0;
  String type='';
  dynamic price;
  String image='';
  String name='';
  bool? isfavorites;
  ItemRoomModel(
      this.id,
      this.type,
      this.price,
      this.image, this.name, this.isfavorites,
      );

  ItemRoomModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    type=json['type'];
    price=json['price'];
    image=json['image'];
    name=json['name'];
    isfavorites=json['is_favorited'];

  }
}
