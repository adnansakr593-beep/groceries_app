import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubits/cart/cart_cubit.dart';
import 'package:groceries_app/cubits/checkout_cubit/checkout_state.dart';
import 'package:groceries_app/models/cart_shop.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.cartCubit) : super(CheckoutInitial());

  final CartCubit cartCubit;

  List<CartItemModel> get cart => cartCubit.cart;

  void orderAccepted() {
    emit(CheckoutLoading());
    if (cart.isNotEmpty) {
      emit(CheckoutSuccsseful());
    } else {
      emit(CheckoutFaluier(errmessage: 'Cart is empty'));
    }
  }
}
