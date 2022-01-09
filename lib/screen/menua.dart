
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/String/main_Strings.dart';
import 'package:order/String/resturant_home_Strings.dart';
import 'package:order/const/string_const.dart';
import 'package:order/view_model/menua_vm/menua_viewmodel_imp.dart';
import 'package:order/widget/menu/home_menua_widget.dart';
import 'package:order/widget/menu/menu_widget.dart';
import 'package:order/widget/menu/menua_widget_callback.dart';



class MenuaScreen extends StatelessWidget {
 final ZoomDrawerController zoomDrawerController;
 final viewModel=MenuaViewModelImp();
 MenuaScreen(this.zoomDrawerController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_MENUA_BG,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                DrawerHeader(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 40),
                          child: CircleAvatar(
                            maxRadius: 40,
                            backgroundColor: COLOR_ICON_DRAWER,
                            child: Icon(Icons.restaurant,size: 40,color: Colors.white,),
                          ),
                        )
                      ],
                    )
                ),
              ],
            ),
            Divider(thickness: 1,),
            HomeMenuWidget(zoomDrawerController: zoomDrawerController),
            Divider(thickness: 1,),
            MenuWidget(icon: Icons.restaurant_rounded,menuName: resturantList,
              callback: viewModel.backToRestutantList,),
            Divider(thickness: 1,),
            MenuWidget(icon: Icons.list,menuName: categoriesText,
              callback: viewModel.navigateCategories,),
            Divider(thickness: 1,),
            MenuWidget(icon: Icons.add_shopping_cart_rounded,menuName: cartText,
              callback: viewModel.navigateCart,),
            Divider(thickness: 1,),
            MenuWidgetCallback(
              icon: Icons.list,
              menuName: orderHistoryText,
              callback: viewModel.checkLoginState(context)?
              viewModel.viewOrderHistory :viewModel.login,
            ),
            Divider(thickness: 1,),
            Spacer(),
            Divider(thickness: 1,),
            MenuWidgetCallback(
              icon: viewModel.checkLoginState(context)? Icons.logout:Icons.login,
              menuName: viewModel.checkLoginState(context) ? logoutTexttt : loginText,
              callback: viewModel.checkLoginState(context)?
              viewModel.logout :viewModel.login,
            ),
            Divider(thickness: 1,),

          ],
        ),
      ),

    );
  }
}




