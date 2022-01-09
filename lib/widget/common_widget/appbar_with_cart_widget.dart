import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/const/string_const.dart';
import 'package:order/screen/cart_screen.dart';
import 'package:order/state/cart_state.dart';
import 'package:order/state/main_state.dart';
import 'package:order/style/colors.dart';



class AppBarWithCartButton extends StatelessWidget implements PreferredSizeWidget {
final String title;
final CartStateControler cartStateControler=Get.find();
final MainStateContolre mainStateContolre=Get.find();
AppBarWithCartButton({required this.title,required this.textsize});
final textsize;
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      title: Text(title,
        style:textsize ? GoogleFonts.jetBrainsMono( color: Colors.white,fontSize: 14)
            : GoogleFonts.jetBrainsMono(
            color: colorWhite,fontWeight: FontWeight.w900
        ),),
      backgroundColor:defultColor,
      foregroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 10,
      actions: [
        Obx(()=> Badge(
          position: BadgePosition(top: 0,end: 1),
          animationDuration: Duration(milliseconds: 200),
          animationType: BadgeAnimationType.scale,
          showBadge: true,
          badgeColor: COLOR_ICON_DRAWER,
          badgeContent: Text('${cartStateControler.getQuentity(mainStateContolre.selectedResturant.value.resturantId)}',style: GoogleFonts.jetBrainsMono(color: Colors.white),),
          child: IconButton(
            onPressed: ()=>Get.to(()=>CartDertailsScreen()),
            icon: Icon(Icons.shopping_bag),
          ),

        )),
        SizedBox(width: 20,),
      ],
    );
  }


  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56.0);
}
