

import 'package:order/firebase/order_referance.dart';
import 'package:order/model/OrderModel.dart';
import 'package:order/view_model/order_history_vm/order_history_view_model.dart';

class OrderHistoryViewModelImp extends OrderHistoryViewModel{
  @override
  Future<List<OrderModel>> getUserHistory(String resturantId,String statusMode) {
return getUserOrderByResturantId(resturantId,statusMode);
  }
  
}