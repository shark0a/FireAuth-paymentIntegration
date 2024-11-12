part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState {}

class PaymentSuccess extends PaymentState {}

class PaymentFaluire extends PaymentState {
  final String errMessage;

  PaymentFaluire({required this.errMessage});
}
