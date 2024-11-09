import 'package:authtest/Feature/cart/data/models/payment_intinet_input_model.dart';
import 'package:authtest/Feature/cart/presentation/repo/checkout_repo.dart';
import 'package:authtest/core/errors/faliures.dart';
import 'package:authtest/core/utils/stripe_services.dart';
import 'package:dartz/dartz.dart';

class CheckoutRepoImplement implements CheckoutRepo {
  final StripeServices stripeServices = StripeServices();
  @override
  Future<Either<Faliure, void>> makePayment(
      {required PaymentIntinetInputModel paymentIntinetInputModel}) async {
    try {
      await stripeServices.makePaymet(
          paymentIntinetInputModel: paymentIntinetInputModel);
      return const Right(null);
    } catch (e) {
      return Left(Faliure(errMessage: e.toString()));
    }
  }
}
