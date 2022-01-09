
import 'package:get/get.dart';
import 'package:order/model/OrderModel.dart';
import 'package:order/model/cart_model.dart';


class OrderHistortState extends GetxController{
  var selectOrder= OrderModel(
      userId: "'userId",
      userName: 'userName',
      userPhone: 'userPhone',
      shippingAddress: 'shippingAddress',
      comment: 'comment',
      orderNumber: 'orderNumber',
      totalPayment: 0,
      finalPayment: 0,
      discount: 0,
      shippingCost: 0,
      cod: true,
      cartItemList: List<CartModel>.empty(),
      restaurantId: 'restaurantId',
      createDate: 0,
      orderStatus: 0).obs;
}