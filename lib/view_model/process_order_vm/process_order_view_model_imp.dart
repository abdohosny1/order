import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:order/firebase/order_referance.dart';
import 'package:order/firebase/server_time_offest_referance.dart';
import 'package:order/model/OrderModel.dart';
import 'package:order/state/cart_state.dart';
import 'package:order/utils/utils.dart';
import 'package:order/view_model/process_order_vm/process_order_view_model.dart';


class ProcessOrderViewModelImp extends ProcessOrderViewModel{

  @override
  Future<bool> submitOrder(OrderModel orderModel) {
 return writeOrderToFirebase(orderModel);
  }

  @override
  Future<OrderModel> createOrderModel({
    required String resturantId,required double discount,
    required String firstname,required String lastName,
    required String address, required String comment,
    required  CartStateControler cartStateControler, required bool iSCod}) async{
    var serverTime=await getServerTimeOffset();
    return OrderModel(
        userId: FirebaseAuth.instance.currentUser!.uid,
        userName: '$firstname $lastName',
        userPhone: FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
        shippingAddress: address,
        comment: comment,
        orderNumber: createOrderNumber(serverTime).toString(),
        totalPayment: cartStateControler.getsubTotal(resturantId),
        finalPayment: calculateFinalPayment(cartStateControler.getsubTotal(resturantId),discount),
        discount: discount,
        shippingCost: cartStateControler.getShippingFee(resturantId),
        cod: iSCod,
        cartItemList: cartStateControler.getCart(resturantId),
        restaurantId: resturantId,
        createDate: serverTime,
        orderStatus: 0);



  }



}