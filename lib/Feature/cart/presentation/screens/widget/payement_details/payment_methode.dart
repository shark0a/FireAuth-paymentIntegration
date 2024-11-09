
import 'package:authtest/Feature/cart/presentation/screens/widget/payement_details/payment_way_widget.dart';
import 'package:flutter/material.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  final List<String> paymentmethodItem = const [
    "lib/core/assets/images/cardpayment.png",
    "lib/core/assets/images/paypal.png",
    "lib/core/assets/images/applepay.png",
  ];

  int itemindex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        itemCount: paymentmethodItem.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                itemindex = index;
              });
              // print("Selected index: $itemindex"); // Debug print
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: PaymentWayWidget(
                imageurl: paymentmethodItem[index],
                isactive: itemindex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
