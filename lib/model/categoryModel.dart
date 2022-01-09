

import 'package:order/model/foodModel.dart';


class CategoryModel {

   String key='';
   String name='';
   String image='';
  //List<FoodModel> foods=List<FoodModel>.empty(growable: true);
late  List<FoodModel>? foods;

  CategoryModel({
   required this.name,required this.image,
    required this.foods
});
  CategoryModel.fromJson(Map<String,dynamic>json){
  //  key=json['key'];

    name=json['name']== null ?'' :json['name'];
    image=json['image']== null ?'' :json['image'];
    if(json['foods'] !=null){
      foods=<FoodModel>[];
      json['foods'].forEach((v){
        foods?.add(FoodModel.fromJson(v));
      });
    }
  }

  Map<String,dynamic> toJson(){
    final data=Map<String,dynamic>();

  //  data['key']=this.key;
    data['name']=this.name;
    data['image']=this.image;
    data['foods']=this.foods?.map((e) => e.toJson()).toList();
    return data;
  }
}