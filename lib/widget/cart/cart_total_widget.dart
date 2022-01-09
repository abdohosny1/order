import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/String/cart_string.dart';
import 'package:order/state/cart_state.dart';
import 'package:order/state/main_state.dart';
import 'package:order/utils/utils.dart';
import 'package:order/widget/cart/cart_total_item_widget.dart';



class CartTotalWidget extends StatelessWidget {
   CartTotalWidget({
    Key? key,
    required this.cartStateControler
  }) : super(key: key);
  final CartStateControler cartStateControler;
  final MainStateContolre mainStateContolre=Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CartTotalItemWidget(
              text: totalText,
              value: currencyFormat.format(cartStateControler.sumCart(mainStateContolre.selectedResturant.value.resturantId)),
              IsSubTotal: false,),
            Divider(thickness: 2,),
            CartTotalItemWidget(
              text: shippingFeetText,
              value: currencyFormat.format(cartStateControler.getShippingFee(mainStateContolre.selectedResturant.value.resturantId)),
              IsSubTotal: false,),
            Divider(thickness: 2,),
            CartTotalItemWidget(
              text: subTotalText,
              value: currencyFormat.format(cartStateControler.getsubTotal(mainStateContolre.selectedResturant.value.resturantId)),
              IsSubTotal: true,),
          ],
        ),
      ),
    );
  }
}

