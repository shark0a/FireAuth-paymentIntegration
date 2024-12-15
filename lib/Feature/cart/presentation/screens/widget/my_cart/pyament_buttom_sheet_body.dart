import 'package:authtest/Feature/cart/presentation/manger/payment_cubit.dart';
import 'package:authtest/Feature/cart/presentation/screens/widget/customize_checkout_button.dart';
import 'package:authtest/Feature/cart/presentation/screens/widget/payement_details/payment_methode.dart';
import 'package:authtest/core/Routers/app_routers.dart';
import 'package:authtest/core/styles/font_styles.dart';
import 'package:authtest/core/styles/fonts/font_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PaymentBottomSheetBody extends StatelessWidget {
  const PaymentBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 30),
        const Text(
          'Payment Method',
          style: FontStyles.blod,
        ),
        const SizedBox(height: 30),
        const PaymentMethods(),
        const SizedBox(
          height: 30,
        ),
        BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentLoading) {
              // Display loading
            } else if (state is PaymentSuccess) {
              GoRouter.of(context).push(AppRouter.kThankYouScreen);
            } else if (state is PaymentFailure) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errMessage.toString())),
              );
            }
          },
          builder: (context, state) {
            bool isLoading = state is PaymentLoading;
            return CustomizeCheckoutButton(
              isLoading: isLoading,
              onTap: () {
                // BlocProvider.of<PaymentCubit>(context).cardpaymentMethod(
                //   paymentIntinetInputModel: PaymentIntinetInputModel(
                //       'cus_RJapgVS0iBK60T',
                //       amount: '100',
                //       currency: 'USD'),
                // );
              },
              title: "Continue",
              width: 200,
              background: FontColors.checkOutButtonColor,
              height: 70,
            );
          },
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
