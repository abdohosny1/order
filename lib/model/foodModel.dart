


import 'package:order/model/addon_model.dart';
import 'package:order/model/size_model.dart';

class FoodModel{
   String description='';
   String image='';
   String name='';
   String id='';
  double price=0;
 // List<SizeModel> size=List<SizeModel>.empty(growable: true);
  //List<AddonModel> addon=List<AddonModel>.empty(growable: true);
 late  List<SizeModel>? size;
 late  List<AddonModel>? addon;

  FoodModel({
    required this.description,
    required this.image,
    required this.name,
    required this.id,
    required this.price,
    required this.size,
    required this.addon
});

  FoodModel.fromJson(Map<String,dynamic> json){
    name=json['name'] ;
    description=json['description'] ;
    image=json['image'] ;
    id=json['id'] ;
    price=double.parse(json['price'].toString()) ;
    if(json['addon'] !=null){
      addon=<AddonModel>[];
      json['addon'].forEach((v){
        addon?.add(AddonModel.fromJson(v));
      });
    }
    if(json['size'] !=null){
      size=<SizeModel>[];
      json['size'].forEach((v){
        size?.add(SizeModel.fromJson(v));
      });
    }
  }



  Map<String,dynamic> toJson(){
    var data=Map<String,dynamic>();
    data['name']=this.name;
    data['price']=this.price;
    data['id']=this.id;
    data['description']=this.description;
    data['size']=this.size?.map((e) =>e.toJson()).toList();
    data['addon']=this.addon?.map((e) => e.toJson()).toList();
    return data;
  }
}