import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:order/model/cart_model.dart';
import 'package:order/screen/place_holder_screen.dart';
import 'package:order/state/cart_state.dart';
import 'package:order/state/main_state.dart';
import 'package:order/view_model/cart_vm/cart_view_model.dart';
import 'package:order/view_model/menua_vm/menua_viewmodel_imp.dart';



class CartViewModelImp implements CartViewModel{
  MainStateContolre mainStateContolre=Get.find();
  final MenuaViewModelImp  menuaViewModelImp=new MenuaViewModelImp();

  void updateCart(CartStateControler cartStateControler,String resturantId,int index,int value){
    //update quentity
    cartStateControler.cart.value=cartStateControler.getCart(resturantId);
    cartStateControler.cart[index].quantity=value;
    cartStateControler.cart.refresh();
    cartStateControler.saveDatabase();
  }
  void deleectedCart(CartStateControler cartStateControler,String resturantId,int index,){

  }
  void clearCart(CartStateControler cartStateControler){
    cartStateControler.clearCart(mainStateContolre.selectedResturant.value.resturantId);
  }

   @override
   processCheckout(BuildContext context, List<CartModel> cart) {

    if(FirebaseAuth.instance.currentUser !=null){
      Get.to(PlaceOrderScreen());
    }else {
      menuaViewModelImp.login(context);
    }
   }

}