import 'dart:ui';

import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:order/state/main_state.dart';
import 'package:order/style/colors.dart';
import 'package:order/view_model/resturant_home_deatils_vm/resturant_home_Detils_vm.dart';
import 'package:order/view_model/resturant_home_deatils_vm/resturant_home_Detils_vm_imp.dart';
import 'package:order/widget/resturant_home_detils/bestDealsWidget.dart';
import 'package:order/widget/resturant_home_detils/mostPopuliarWidget.dart';



class ResturantHomeDetails extends StatelessWidget {


  final MainStateContolre mainStateContoler=Get.find();
  final ResturantHomeDetilsVM  viewModel=ResturantHomeDetilsVMIMp();
  final ZoomDrawerController zoomDrawerController;
  ResturantHomeDetails(this.zoomDrawerController);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('${mainStateContoler.selectedResturant.value.name}',
              style: GoogleFonts.jetBrainsMono(
                  color: colorWhite,fontWeight: FontWeight.w900
              ),),
            backgroundColor: defultColor,
            foregroundColor: Colors.black,
           // iconTheme: IconThemeData(color: colorIcon),
            elevation: 10,
            leading: InkWell(child: Icon(Icons.view_headline),onTap: ()=>zoomDrawerController.toggle!(),),
          ),
          body: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: MostPupliurWidhet(viewModel: viewModel, mainStateContoler: mainStateContoler)
                ),
                Expanded(
                    flex: 2,
                    child: BestDealsWidget(viewModel: viewModel, mainStateContoler: mainStateContoler)
                ),
              ],
            ),
          ),
        )
    );
  }
}
