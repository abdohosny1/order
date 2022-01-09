import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/String/main_Strings.dart';
import 'package:order/String/place_holder_string.dart';
import 'package:order/screen/resturant_home.dart';
import 'package:order/state/cart_state.dart';
import 'package:order/state/main_state.dart';
import 'package:order/state/place_order_state.dart';
import 'package:order/style/colors.dart';
import 'package:order/utils/const.dart';
import 'package:get/get.dart';

import 'package:order/view_model/process_order_vm/process_order_view_model_imp.dart';
class PlaceOrderScreen extends StatelessWidget {
  const PlaceOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final placeOrderState= Get.put(PlaceOrderState());
    final placeOrderVm=ProcessOrderViewModelImp();
    final CartStateControler cartStateControler=Get.find();
    final MainStateContolre mainStateContolre=Get.find();

    final firstNameTextControler=TextEditingController();
    final lastNameTextControler=TextEditingController();
    final addressTextControler=TextEditingController();
    final commentTextControler=TextEditingController();

    final formKey=GlobalKey<FormState>();

    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(placeOrderText,style: GoogleFonts.jetBrainsMono(
            fontWeight: FontWeight.w900,color: colorWhite
        ),),
        backgroundColor: defultColor,
        elevation: 10,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: TextFormField(
                    controller: firstNameTextControler,
                    validator: ValidationBuilder(requiredMessage:'$firstNameText $requrimentText' )
                        .required().build(),
                    decoration: InputDecoration(
                      hintText: firstNameText,
                      labelText: firstNameText,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))

                      )
                    ),
                  )),
                  SizedBox(width: 8,),
                  Expanded(child: TextFormField(
                    controller: lastNameTextControler,
                    validator: ValidationBuilder(requiredMessage:'$lastNameText $requrimentText' )
                        .required().build(),
                    decoration: InputDecoration(
                      hintText: lastNameText,
                      labelText: lastNameText,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))


                      )
                    ),
                  )),
                ],
              ),
              SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: addressTextControler,
                    validator: ValidationBuilder(requiredMessage:'$address $requrimentText' )
                        .required().build(),
                    decoration: InputDecoration(
                        hintText: address,
                        labelText: address,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))

                        )
                    ),
                  )

                ],
              ),
              SizedBox(height: 10,),
             Obx(()=> Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(paymentText,style: GoogleFonts.jetBrainsMono(
                     fontSize: 22,fontWeight: FontWeight.bold

                 ),textAlign: TextAlign.left,
                 ),
                 RadioListTile<String>(
                     title: Text(codText),
                     value: COO_VAL,
                     groupValue: placeOrderState.paymentSelected.value,
                     onChanged: (String? v){
                       placeOrderState.paymentSelected.value=v!;
                     }),
                 RadioListTile<String>(
                     title: Text(brainTreeText),
                     value: BRAINTREE_VAL,
                     groupValue: placeOrderState.paymentSelected.value,
                     onChanged: (String? v){
                       placeOrderState.paymentSelected.value=v!;
                     }),

               ],
             ),),
              SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: commentTextControler,
                    validator: ValidationBuilder(requiredMessage:'$commentText $requrimentText' )
                    .required().build(),
                    decoration: InputDecoration(
                        hintText: commentText,
                        labelText: commentText,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))

                        )
                    ),
                  )

                ],
              ),
              Spacer(),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  color: colorsBlack,
                  textColor: Colors.white,

                  onPressed: () async{

                    if(formKey.currentState!.validate()) {
                   var order= await placeOrderVm.createOrderModel(
                       resturantId: mainStateContolre.selectedResturant.value.resturantId,
                       discount: 0,
                       firstname: firstNameTextControler.text,
                       lastName: lastNameTextControler.text,
                       address: addressTextControler.text,
                       comment: commentTextControler.text,
                       cartStateControler: cartStateControler,
                       iSCod: placeOrderState.paymentSelected.value==COO_VAL ?true:false);

                   var result=await placeOrderVm.submitOrder(order);
                   Get.defaultDialog(
                     title: result ?orderSuccessText:orderFailText,
                     middleText: result ?orderSuccessMassageText :orderFailMassageText,
                    // textCancel: cancleText,
                     cancel: Container(),
                     onCancel: (){},
                     textConfirm: confirmTextt,
                     cancelTextColor: Colors.yellow,
                     onConfirm: (){
                       cartStateControler.clearCart(mainStateContolre.selectedResturant.value.resturantId);
                       Get.offAll(()=>ResturantHome());
                     },


                   );
                    }
                  },
                  child: Text(placeOrderText),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
