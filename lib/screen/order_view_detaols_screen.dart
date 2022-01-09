import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:order/state/order_history_state.dart';
import 'package:order/utils/utils.dart';

class OrderViewDetailsScreenx extends StatelessWidget {


  final OrderHistortState orderHistortState=Get.find();

  @override
  Widget build(BuildContext context) {
    var orderModel=orderHistortState.selectOrder.value;
    var chipBackgroundColors=convertStatusToColors(orderModel.orderStatus);
    var chipForgroundColrs=chipBackgroundColors.computeLuminance() <.5 ?Colors.white :Colors.black ;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Order ${orderModel.orderNumber}'),
        actions: [
          (orderModel.orderStatus==0 || orderModel.orderStatus ==1)
          ? InkWell(
            child: Icon(Icons.clear),
            onTap: (){},
          )
              : Container()
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1,child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${orderModel.userName.toUpperCase()}',style: TextStyle(
                        fontSize: 20,fontWeight: FontWeight.w900
                      ),),
                      Text('${orderModel.shippingAddress}',style: TextStyle(
                          fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey
                      ),),
                      Text('${orderModel.userPhone}',style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.w900
                      ),),
                    ],
                  )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Chip(
                        backgroundColor: chipBackgroundColors,
                          label:Text('${convertToSatus(orderModel.orderStatus)}',style: TextStyle(
                            color: chipForgroundColrs
                          ),)
                      ),

                    ],
                  )

                ],
              ),
              Divider(thickness: 1,),
              

            ],
            ),
          )),
          Expanded(flex: 3,child: Container(color: Colors.blue,)),
        ],
      ),

    ));
  }
}
