import 'package:authtest/Feature/cart/data/models/payment_intinet_input_model.dart';
import 'package:authtest/core/errors/faliures.dart';
import 'package:dartz/dartz.dart';

abstract class CheckoutRepo {
  Future<Either<Faliure, void>> makePayment(
      {required PaymentIntinetInputModel paymentIntinetInputModel});
}
