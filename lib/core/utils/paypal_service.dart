import 'package:authtest/core/Routers/app_routers.dart';
import 'package:authtest/core/utils/secret_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';

class PaypalService {
  void makepaypalPayment(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: "${SecretKeys.clientid}",
        secretKey: "${SecretKeys.paypalsecert}",
        transactions: const [
          {
            "amount": {
              "total": '100',
              "currency": "USD",
              "details": {
                "subtotal": '100',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": {
              "items": [
                {
                  "name": "Apple",
                  "quantity": 4,
                  "price": '5',
                  "currency": "USD"
                },
                {
                  "name": "Pineapple",
                  "quantity": 8,
                  "price": '10',
                  "currency": "USD"
                }
              ],

              // shipping address is not required though
              //   "shipping_address": {
              //     "recipient_name": "tharwat",
              //     "line1": "Alexandria",
              //     "line2": "",
              //     "city": "Alexandria",
              //     "country_code": "EG",
              //     "postal_code": "21505",
              //     "phone": "+00000000",
              //     "state": "Alexandria"
              //  },
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          GoRouter.of(context).push(AppRouter.kThankYouScreen);
          print(
              "\n \n \n onSuccess========================================: ${params.toString()}");
        },
        onError: (error) {
          print("onError=========================================: $error");
          GoRouter.of(context).pop();
        },
        onCancel: () {
          print(
              '===================================================cancelled:');
        },
      ),
    ));
  }
}
