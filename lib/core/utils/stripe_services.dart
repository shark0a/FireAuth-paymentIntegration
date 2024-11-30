import 'package:authtest/Feature/cart/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:authtest/Feature/cart/data/models/payment_intinet_input_model.dart';
import 'package:authtest/core/utils/api_service.dart';
import 'package:authtest/core/utils/secret_keys.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {
  final url = 'https://api.stripe.com/v1/payment_intents';
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createpaymentIntent(
      PaymentIntinetInputModel paymentIntinetInputModel) async {
    var resposne = await apiService.post(
        url: url,
        contentType: Headers.formUrlEncodedContentType,
        body: paymentIntinetInputModel.toJson(),
        token: SecretKeys.secret);
    var paymentintentModel = PaymentIntentModel.fromJson(resposne.data);
    return paymentintentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      merchantDisplayName: 'Ahmed Elsharkawy',
      paymentIntentClientSecret: paymentIntentClientSecret,
    ));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePaymet(
      {required PaymentIntinetInputModel paymentIntinetInputModel}) async {
    var paymentIntetModdel =
        await createpaymentIntent(paymentIntinetInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntetModdel.clientSecret!);
    await displayPaymentSheet();
  }
}
