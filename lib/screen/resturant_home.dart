

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:order/screen/menua.dart';
import 'package:order/screen/resturant_home_deatils.dart';


class ResturantHome extends StatelessWidget {

final drawerZoomControler = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ZoomDrawer(
        mainScreen: ResturantHomeDetails(drawerZoomControler),
        menuScreen: MenuaScreen(drawerZoomControler),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        backgroundColor: Colors.grey[300]!,
        slideWidth: MediaQuery.of(context).size.width*0.65,
        openCurve: Curves.bounceInOut,
        closeCurve: Curves.ease,
        controller: drawerZoomControler,
      ),
    ));
  }
}




