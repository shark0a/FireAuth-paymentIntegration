import 'package:authtest/Feature/cart/presentation/screens/widget/payement_details/credite_card_form.dart';
import 'package:authtest/Feature/cart/presentation/screens/widget/payement_details/payment_methode.dart';
import 'package:flutter/material.dart';

class PaymentDetailsScreenBody extends StatelessWidget {
  const PaymentDetailsScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 15)),
        SliverToBoxAdapter(child: PaymentMethods()),
        SliverToBoxAdapter(child: SizedBox(height: 15)),
        SliverToBoxAdapter(child: CrediteCardForm()),
      ],
    );
  }
}
