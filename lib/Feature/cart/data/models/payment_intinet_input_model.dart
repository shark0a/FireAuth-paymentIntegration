class PaymentIntinetInputModel {
  final String amount;
  final String currency;

  PaymentIntinetInputModel({required this.amount, required this.currency});

  toJson() {
    return {
      'amount': amount,
      'currency': currency,
    };
  }
}
