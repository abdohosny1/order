

import 'package:order/model/cart_model.dart';

class OrderModel{
  String userId='',
      userName='',
      userPhone='',
  shippingAddress='',
  comment='',
  orderNumber='',
  restaurantId='';
  double totalPayment=0, finalPayment=0,discount=0,shippingCost=0;
  bool cod=false;

  List<CartModel> cartItemList=List<CartModel>.empty(growable: true);
  int createDate=0, orderStatus=0;

  OrderModel({
     required this.userId,
    required  this.userName,
    required this.userPhone,
    required  this.shippingAddress,
    required  this.comment,
    required  this.orderNumber,
    required  this.totalPayment,
    required this.finalPayment,
    required this.discount,
    required  this.shippingCost,
    required  this.cod,
    required this.cartItemList,
    required  this.restaurantId,
    required this.createDate,
    required this.orderStatus});


  OrderModel.fromJson(Map<String,dynamic> json){
    userId=json['userId'];
    userName=json['userName'];
    userPhone=json['userPhone'];
    shippingAddress=json['shippingAddress'];
    comment=json['comment'];
    orderNumber=json['orderNumber'];
  //  restaurantId=json['restaurantId'];
    totalPayment=double.parse(json['totalPayment']);
    finalPayment=double.parse(json['finalPayment']);
    shippingCost=double.parse(json['shippingCost']);
   // discount=json['discount'];
    cod=json['cod'] as bool;
    createDate=json['createDate'];
    orderStatus=int.parse(json['orderStatus']);

    if(json['cartItemList'] !=null){
      json['cartItemList'].forEach((v){
        cartItemList.add(CartModel.fromJson(v));
      });
    }
  }

  Map<String,dynamic> toJson(){
    final data=Map<String,dynamic>();
    data['userId']=this.userId;
    data['userName']=this.userName;
    data['userPhone']=this.userPhone;
    data['shippingAddress']=this.shippingAddress;
    data['comment']=this.comment;
    data['orderNumber']=this.orderNumber;
    data['totalPayment']=this.totalPayment;
    data['finalPayment']=this.finalPayment;
    data['shippingCost']=this.shippingCost;
    data['cod']=this.cod;
    data['orderStatus']=this.orderStatus;
    data['cartItemList']=this.cartItemList.map((e) => e.toJson()).toList();
    data['createDate']=this.createDate;
    data['discount']=this.discount;
    data['restaurantId']=this.restaurantId;

    return data;
  }
}



