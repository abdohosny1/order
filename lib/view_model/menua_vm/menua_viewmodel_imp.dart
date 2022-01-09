import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_auth_ui/flutter_auth_ui.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:order/String/main_Strings.dart';
import 'package:order/screen/cart_screen.dart';
import 'package:order/screen/category.dart';
import 'package:order/screen/order_history_Screen.dart';
import 'package:order/screen/resturant_home.dart';
import 'package:order/state/cart_state.dart';
import 'package:order/state/main_state.dart';
import 'package:order/utils/const.dart';
import 'package:order/view_model/menua_vm/menu_view_model.dart';



class MenuaViewModelImp extends MenuViewModel{
  final cartState=Get.put(CartStateControler());
  final mainstate=Get.put(MainStateContolre());
  @override
  void navigateCategories() {
    Get.to(()=>CategoryScreen());
  }

  @override
  void backToRestutantList() {
    Get.back(closeOverlays: true,canPop: false);
  }



  @override
  bool checkLoginState(BuildContext context) {
   return FirebaseAuth.instance.currentUser !=null  ? true :false;
  }

  @override
  void login(BuildContext context) {
    var user=FirebaseAuth.instance.currentUser;
    if(user ==null){
      FlutterAuthUi.startUi(
          items: [AuthUiProvider.phone],
          tosAndPrivacyPolicy: TosAndPrivacyPolicy(
              tosUrl: 'https://google.com',
              privacyPolicyUrl: 'https://youtube.com'),
        androidOption: AndroidOption(
          enableSmartLock: false,
          showLogo: true,
          overrideTheme: true,
        )
      ).then((value) async{
        navigationHome(context);
      }).catchError((e){
        Get.snackbar('Error', '$e');
      });

    }
  }

  @override
  void logout(BuildContext context) {

    Get.defaultDialog(
      title: logoutTitle,
      content: Text(logoutText),
      backgroundColor: Colors.white,
      cancel: ElevatedButton(
          onPressed: ()=>Get.back(),
          child: Text(cancleText),),
      confirm: ElevatedButton(
        onPressed: (){
          FirebaseAuth.instance.signOut()
            .then((value) => Get.offAll(ResturantHome()));},
        child: Text(confirmText,style: TextStyle(color: Colors.yellow)),),


    );


  }

  @override
  void navigationHome(BuildContext context) async{
    var token=await FirebaseAuth.instance.currentUser!
        .getIdToken();

    var box=GetStorage();
    //Save token to send notification
    box.write(BOX_TOKEN, token);
    // clone cart
    if(cartState.cart.length>0){ // if not empty

      var newCart=cartState.getCartAnonymous(mainstate.selectedResturant.value.resturantId); //remmber get anonmous
       cartState.margeCart(newCart,mainstate.selectedResturant.value.resturantId);
       //Add to global cart
      cartState.saveDatabase();
    }
    Get.offAll(()=>ResturantHome());

  }

 

  @override
  void navigateCart() =>Get.to(CartDertailsScreen());

  @override
  void viewOrderHistory(BuildContext context) {
    Get.to(()=>OrderHistoryScreen());
  }
}