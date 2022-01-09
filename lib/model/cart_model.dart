

import 'package:order/model/foodModel.dart';


class CartModel extends FoodModel{
 int quantity=0;
 String restaurantId='';
 String userUid='';
 CartModel({
  description, image, name,id, price, size, addon,
   required this.quantity ,required this.restaurantId,required this.userUid}):super
     (
 id:id,
 image:image,
 size:size,
 name:name,
 addon:addon,
 description:description,
     price: price,

      ) ;

 factory CartModel.fromJson(Map<String,dynamic> json){
   final food=FoodModel.fromJson(json);
   final quantity=json['quantity'];
   final restaurantId=json['restaurantId'];
   final userUid=json['userUid'];
   return CartModel(
     price: food.price,
     quantity: quantity,
     description: food.description,
     addon: food.addon,
     name: food.name,
     size: food.size,
     id: food.id,
     image: food.image,
       restaurantId: restaurantId,
     userUid: userUid
   );
 }

 Map<String,dynamic> toJson(){
   var data=Map<String,dynamic>();
   data['name']=this.name;
   data['price']=this.price;
   data['id']=this.id;
   data['description']=this.description;
   data['quantity']=this.quantity;
   data['restaurantId']=this.restaurantId;
   data['userUid']=this.userUid;
   data['size']=this.size?.map((e) =>e.toJson()).toList();
   data['addon']=this.addon?.map((e) => e.toJson()).toList();
   return data;
 }

}