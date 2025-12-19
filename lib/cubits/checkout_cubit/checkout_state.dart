abstract class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutFaluier extends CheckoutState 
{
   String errmessage;
  CheckoutFaluier({ required this.errmessage});
}

final class CheckoutSuccsseful extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}
