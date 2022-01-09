import 'package:flutter/material.dart';
import 'package:order/String/order_history_String.dart';
import 'package:order/model/OrderModel.dart';
import 'package:order/state/main_state.dart';
import 'package:order/view_model/order_history_vm/order_history_view_model_imp.dart';
import 'package:order/widget/order_history/order_history_list_widget.dart';


class OrderHistoryWidget extends StatelessWidget {
  const OrderHistoryWidget({Key? key,
  required this.mainStateContolre,required this.vm,required this.orderStatusMode}) : super(key: key);
  final OrderHistoryViewModelImp vm;
  final MainStateContolre mainStateContolre;
  final String orderStatusMode;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: vm.getUserHistory(mainStateContolre.selectedResturant.value.resturantId,orderStatusMode),
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }else{
          var lst=snapshot.data as List<OrderModel>;
          if(lst.length ==0){
            return Center(child: Text(emptyText),);
          }
          return OrderHistoryListWidget(listorder:lst);

        }
      },
    );
  }
}
