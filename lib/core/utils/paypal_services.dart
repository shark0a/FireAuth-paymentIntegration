import 'dart:convert';

import 'package:authtest/Feature/cart/data/models/PayPal_models/get_access_token.dart';
import 'package:authtest/Feature/cart/data/models/PayPal_models/transactions_input_model/transactions_input_model.dart';
import 'package:authtest/core/utils/api_service.dart';

class PayPalService {
  final ApiService apiService = ApiService();
  Future<GetAccessToken> getAccessToken(
      {required String clientid, required String clientsecret}) async {
    final encodedCredentials =
        base64Encode(utf8.encode('$clientid:$clientsecret'));
    var response = await apiService.post(
      url: "https://api-m.sandbox.paypal.com/v1/oauth2/token",
      body: {
        'grant_type': 'client_credentials',
      },
      headers: {
        'Authorization': 'Basic $encodedCredentials',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    var token = GetAccessToken.fromJson(jsonDecode(response.data));
    return token;
  }

  Future<Map<String, dynamic>> createPayment({
    required String accessToken,
    required TransactionsInputModel transactionsInputModel,
  }) async {
    var response = await apiService.post(
      url: "https://api-m.sandbox.paypal.com/v1/payments/payment",
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: {
        "intent": "sale",
        "payer": {"payment_method": "paypal"},
        "transactions": [
          {
            "amount": transactionsInputModel.amount!.toJson(),
            "description": transactionsInputModel.description,
            "item_list": transactionsInputModel.itemList!.toJson(),
          }
        ]
      },
    );

    return response.data;
  }
}
