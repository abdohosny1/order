import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:order/String/cart_string.dart';
import 'package:order/model/cart_model.dart';
import 'package:order/model/foodModel.dart';
import 'package:order/utils/const.dart';



class CartStateControler extends GetxController{
  var cart=List<CartModel>.empty(growable: true).obs;
  final box=GetStorage();

  addToCart(FoodModel foodModel,String resturantId ,{int quantity:1}) async {

    try{
      var cartitem=CartModel(
          image: foodModel.image,
          id: foodModel.id,
        size: foodModel.size,
        name: foodModel.name,
          addon: foodModel.addon,
        description: foodModel.description,
        price: foodModel.price,
        quantity:quantity,
        restaurantId:resturantId,
        userUid: FirebaseAuth.instance.currentUser==null ?
            KEY_ANONYMOUS
            :FirebaseAuth.instance.currentUser!.uid,
      );
       if(isExists(cartitem,resturantId)) {
         //if cart item alerady avabile in cart ,we will updat quentity
         var foodNeedToUpdate=
             getCartNeedTOUpdate(cartitem, resturantId);
         if(foodNeedToUpdate !=null)
         foodNeedToUpdate.quantity += quantity;
       }
       else {
         cart.add(cartitem,);
       }
       //after update info ,we will save it to storage
      var jsonDBEncode=jsonEncode(cart);
       await box.write(MY_CART_KEY, jsonDBEncode);
       cart.refresh();
       Get.snackbar(sucesssTitle, scussesMassage);
    }catch(e){
      Get.snackbar(errorTitle, e.toString());
      print(e.toString());
    }
  }

  List <CartModel> getCart(String resturantId) =>cart.where((item) =>item.restaurantId==resturantId &&(
  FirebaseAuth.instance.currentUser ==null
     ? item.userUid ==KEY_ANONYMOUS
     : item.userUid==FirebaseAuth.instance.currentUser!.uid
  ) ).toList();

  List <CartModel>  getCartAnonymous(String resturantId) =>cart.where((item) =>item.restaurantId==resturantId &&(
     item.userUid ==KEY_ANONYMOUS ) ).toList();

   isExists(CartModel cartitem,String resturantId)  =>  cart.any((element) =>
   element.id==cartitem.id && element.restaurantId==resturantId && element.userUid ==(
   FirebaseAuth.instance.currentUser ==null
       ?  KEY_ANONYMOUS
       : FirebaseAuth.instance.currentUser!.uid
   ));


  sumCart(String resturantId) => getCart(resturantId).length == 0 ?
        0 :
        getCart(resturantId).map((element) =>element.price * element.quantity )
        .reduce((value, element) => value +element);

   getQuentity(String resturantId)=> getCart(resturantId).length == 0?
        0 :
        getCart(resturantId).map((element) => element.quantity)
        .reduce((value, element) => value+element);


  getShippingFee(String resturantId)=>sumCart(resturantId)*0.1 ;//10% of total value

getsubTotal(String resturantId)=> sumCart(resturantId) +getShippingFee(resturantId) ;

clearCart(String resturantId){
   cart.value=getCart(resturantId);
   cart.clear();
  saveDatabase();
}

 saveDatabase() =>box.write(MY_CART_KEY, jsonEncode(cart));

  void margeCart(List<CartModel> cartItem, String resturantId) {
    if(cart.length >0){
       
      cartItem.forEach((element) {
        if(isExists(element, resturantId)){
          var foodNeedToUpdate=getCartNeedTOUpdate(element,resturantId);
          if(foodNeedToUpdate !=null){
            foodNeedToUpdate.quanitity +=element.quantity;
          }
          else{
            var newCart=element;
            element.userUid=FirebaseAuth.instance.currentUser!.uid;
            cart.add(newCart);
          }
        }
      });
      
    }
  }

  getCartNeedTOUpdate(CartModel cartItem, String resturantId) => cart.firstWhere((element) =>
  element.id==cartItem.id && element.restaurantId==resturantId && element.userUid ==(
      FirebaseAuth.instance.currentUser ==null
          ?  KEY_ANONYMOUS
          : FirebaseAuth.instance.currentUser!.uid
  ));

}