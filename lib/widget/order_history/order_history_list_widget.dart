import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/const/string_const.dart';
import 'package:order/model/OrderModel.dart';
import 'package:order/screen/order_view_detaols_screen.dart';
import 'package:order/state/order_history_state.dart';
import 'package:order/utils/utils.dart';
import 'package:order/widget/common_widget/common_widget.dart';


class OrderHistoryListWidget extends StatelessWidget {
   OrderHistoryListWidget({Key? key,required this.listorder}) : super(key: key);

  final List<OrderModel> listorder;
  final orderDetailsState =Get.put(OrderHistortState());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: LiveList(
            showItemInterval: Duration(milliseconds: 300),
            showItemDuration: Duration(milliseconds: 300),
              reAnimateOnVisibility: true,
              scrollDirection: Axis.vertical,
              itemCount: listorder.length,
            itemBuilder: animationItemBulider((index)=>InkWell(
              onTap: (){
                orderDetailsState.selectOrder.value=listorder[index];
                Get.to(()=>OrderViewDetailsScreenx());
                
              },
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: [
                    CachedNetworkImage(
                        imageUrl: listorder[index].cartItemList[0].image,
                      fit: BoxFit.cover,
                      errorWidget: (context,url,erro)=>Center(child: Icon(Icons.image),),
                      progressIndicatorBuilder: (context,url,dow)=>Center(child: CircularProgressIndicator(),),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: COLOR_OVERLAY,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 20,bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Order #${listorder[index].orderNumber}',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.jetBrainsMono(
                                        fontWeight: FontWeight.w900,color: Colors.white,fontSize: 18
                                      ),),
                                      Text('Date ${convertToDate(listorder[index].createDate)}',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.jetBrainsMono(
                                             color:Colors.white,fontSize: 18
                                        ),),
                                      Text('Order Status ${convertToSatus(listorder[index].orderStatus)}',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.jetBrainsMono(
                                            color:Colors.white,fontSize: 18
                                        ),)
                                    ],
                                  )

                                ],
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
          ),
        )
      ],
    );
  }
}
