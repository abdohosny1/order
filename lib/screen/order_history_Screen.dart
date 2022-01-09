import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/String/main_Strings.dart';
import 'package:order/state/main_state.dart';
import 'package:order/style/colors.dart';
import 'package:order/utils/const.dart';
import 'package:order/view_model/order_history_vm/order_history_view_model_imp.dart';
import 'package:order/widget/order_history/order_history_widget.dart';


class OrderHistoryScreen extends StatelessWidget {
 // const OrderHistoryScreen({Key? key}) : super(key: key);
  final vm= new OrderHistoryViewModelImp();
  final MainStateContolre mainStateContolre=Get.find();


  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(orderHistoryText,style: GoogleFonts.jetBrainsMono(
              fontWeight: FontWeight.w900,color: colorWhite
          ),),
          backgroundColor: defultColor,
          elevation: 10,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.cancel),),
              Tab(icon: Icon(Icons.refresh),),
              Tab(icon: Icon(Icons.check),),
            ],
          ),
        ),
        body: TabBarView(
          children: [

            OrderHistoryWidget(
                mainStateContolre: mainStateContolre,
                vm: vm,
                orderStatusMode: ORDERED_CANCLED),
            OrderHistoryWidget(
                mainStateContolre: mainStateContolre,
                vm: vm,
                orderStatusMode: ORDERED_PROCESSING),
            OrderHistoryWidget(
                mainStateContolre: mainStateContolre,
                vm: vm,
                orderStatusMode: ORDERED_SHIPPED),

          ],
        ),
      ),
    )
    );
  }
}
