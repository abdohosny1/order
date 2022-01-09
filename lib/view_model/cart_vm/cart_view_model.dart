
import 'package:flutter/cupertino.dart';
import 'package:order/model/cart_model.dart';
import 'package:order/state/cart_state.dart';


abstract class CartViewModel{
  void updateCart(CartStateControler cartStateControler,String resturantId,int index,int value);
  void deleectedCart(CartStateControler cartStateControler,String resturantId,int index,);
  void clearCart(CartStateControler cartStateControler);
  void  processCheckout(BuildContext context, List<CartModel> cart);

}