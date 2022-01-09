import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/String/cart_string.dart';
import 'package:order/state/cart_state.dart';
import 'package:order/state/main_state.dart';
import 'package:order/style/colors.dart';
import 'package:order/view_model/cart_vm/cart_view_model_imp.dart';
import 'package:order/widget/cart/cart_image_widget.dart';
import 'package:order/widget/cart/cart_info_widget.dart';
import 'package:order/widget/cart/cart_total_widget.dart';



class CartDertailsScreen extends StatelessWidget {

 // final box=GetStorage();
  final CartStateControler cartStateControler=Get.find();
  final MainStateContolre mainStateContolre=Get.find();
  final CartViewModelImp cartViewModel=CartViewModelImp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',style: GoogleFonts.jetBrainsMono(
        fontWeight: FontWeight.w900,color: colorWhite
        ),),
      backgroundColor: defultColor,
      elevation: 10,
        actions: [
          cartStateControler.getQuentity(mainStateContolre.selectedResturant.value.resturantId) > 0
           ? IconButton(onPressed: (){
            Get.defaultDialog(
              title: clearCartConfirmText,
              middleText: clearCartConfirmContent,
              textCancel: delectedCartConfirmCancle,
              textConfirm:delectedCartConfirmConfirm,
              confirmTextColor: Colors.white,

              onConfirm: ()=> cartViewModel.clearCart(cartStateControler),
            );

          }, icon: Icon(Icons.clear))
           : Container(),
        ],
      ),
      body: cartStateControler.getQuentity(mainStateContolre.selectedResturant.value.resturantId) > 0
      ? Obx(()=> Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount:(cartStateControler.getCart(mainStateContolre.selectedResturant.value.resturantId)as List).length ,
                itemBuilder: (context,index)=>Slidable(
                    child: Card(
                      elevation: 0.8,
                      margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
                      child: Container(
                        padding:  const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Cart_image_Widget
                                (model:cartStateControler.getCart(mainStateContolre.selectedResturant.value.resturantId)[index],
                                  cartStateControler: cartStateControler),
                            ),
                            Expanded(
                              flex: 6,
                                child: Cart_Info_Widget(model:cartStateControler.getCart(mainStateContolre.selectedResturant.value.resturantId)[index],cartStateControler: cartStateControler)), Center(
                              child: ElegantNumberButton(
                                  initialValue: cartStateControler.getCart(mainStateContolre.selectedResturant.value.resturantId)[index].quantity,
                                  minValue: 1,
                                  maxValue: 100,
                                  color: Colors.amber,
                                  onChanged: (value){
                                    cartViewModel.updateCart(cartStateControler,mainStateContolre.selectedResturant.value.resturantId,index,value.toInt());
                                  },
                                  decimalPlaces: 0),
                            )
                          ],
                        ),
                      ),
                    ),
                    actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: .25,
                  secondaryActions: [
                    IconSlideAction(
                      caption: deletText,
                      icon: Icons.delete,
                      color: defultColor,
                      onTap: (){
                        Get.defaultDialog(
                          title: delectedCartConfirmText,
                          middleText: delectedCartConfirmContent,
                          textCancel: delectedCartConfirmCancle,
                          textConfirm:delectedCartConfirmConfirm,
                          confirmTextColor: Colors.yellow ,

                          onConfirm: (){cartViewModel.deleectedCart(cartStateControler,mainStateContolre.selectedResturant.value.resturantId,index);Get.back();
                          }
                        );

                      },

                    )

                  ],
                )),
          ),
          CartTotalWidget(cartStateControler: cartStateControler,),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
            width: double.infinity,
            child: MaterialButton(
              color: colorsBlack,
              textColor: Colors.white,
              onPressed: ()=>cartViewModel.processCheckout(context,cartStateControler.getCart(mainStateContolre.selectedResturant.value.resturantId)),
              child: Text(checkOutText),
            ),
          )


        ],

      ))
      :Center(child: Text(CartEptyText),),
    );
  }
}






