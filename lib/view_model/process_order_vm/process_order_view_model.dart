

import 'package:order/model/OrderModel.dart';
import 'package:order/state/cart_state.dart';

abstract class ProcessOrderViewModel{

  Future<OrderModel> createOrderModel({
    required String resturantId,required double discount,
    required String firstname,required String lastName,
    required String address, required String comment,
    required  CartStateControler cartStateControler, required bool iSCod});
}