import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/model/popularItem.dart';
import 'package:order/state/main_state.dart';
import 'package:order/view_model/resturant_home_deatils_vm/resturant_home_Detils_vm.dart';



class BestDealsWidget extends StatelessWidget {
  const BestDealsWidget({
    Key? key,
    required this.viewModel,
    required this.mainStateContoler,
  }) : super(key: key);

  final ResturantHomeDetilsVM viewModel;
  final MainStateContolre mainStateContoler;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: viewModel.displayBestDealBYResrurantID(mainStateContoler.selectedResturant.value.resturantId),
        builder: (context,snapshot){
          if(snapshot.connectionState ==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else{
            var lstBestDeal=snapshot.data as List<PopularItemModel>;
            return CarouselSlider(
                items: lstBestDeal.map((e) => Builder(builder: (context){
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                  sigmaX: 5,sigmaY: 5
                              ),
                              child: CachedNetworkImage(
                                errorWidget: (context,url,error)=>Center(child: Icon(Icons.image),),
                                imageUrl: e.image,fit: BoxFit.cover,
                                progressIndicatorBuilder: (context,url,dow)=>Center(child: CircularProgressIndicator(),),

                              ),
                            ),
                            Center(child: Text(e.name,style: GoogleFonts.jetBrainsMono(
                                color: Colors.white,fontSize: 18
                            ),),)
                          ],
                        )
                    ),
                  );
                })).toList(),
                options:CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 2),
                    autoPlayCurve: Curves.easeIn,
                    height: double.infinity
                ) );
          }
        },
      ),
    );
  }
}