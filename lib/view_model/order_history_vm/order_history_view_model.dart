

import 'package:order/model/OrderModel.dart';

abstract class OrderHistoryViewModel {
  Future<List<OrderModel>> getUserHistory(String resturantId,String statusMode);
}