import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:order/const/string_const.dart';
import 'package:order/model/OrderModel.dart';
import 'package:order/utils/const.dart';


Future<bool> writeOrderToFirebase( OrderModel orderModel) async{
  try{
    await FirebaseDatabase.instance
    .reference()
    .child(RESTURANT_REF)
    .child(orderModel.restaurantId)
    .child(ORDER_REF)
    .child(orderModel.orderNumber)
    .set(orderModel.toJson());

   return true;
  }catch(e){
    return false;
  }

}

Future<List<OrderModel>> getUserOrderByResturantId(String resturantId,String statusMode)async{
  var orderStatusMode=statusMode==ORDERED_CANCLED? -1:2;
  var userId=FirebaseAuth.instance.currentUser!.uid;
  var list=new List<OrderModel>.empty(growable: true);

  var source=await FirebaseDatabase.instance
  .reference()
  .child(RESTURANT_REF)
  .child(resturantId)
  .child(ORDER_REF)
  .orderByChild('userId')
  .equalTo(userId)
  .once();

  Map<dynamic,dynamic> value=source.value;
  value.forEach((key, value) {
    list.add(OrderModel.fromJson(jsonDecode(jsonEncode(value))));
  });
return list.where((element) =>statusMode== ORDERED_PROCESSING
    ?(element.orderStatus== 0 || element.orderStatus==1)
    : element.orderStatus==orderStatusMode).toList();
}