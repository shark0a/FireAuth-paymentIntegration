import 'package:authtest/Feature/cart/presentation/screens/thank_you_screen.dart';
import 'package:authtest/Feature/cart/presentation/screens/widget/customize_checkout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CrediteCardForm extends StatefulWidget {
  const CrediteCardForm({
    super.key,
  });

  @override
  State<CrediteCardForm> createState() => _CrediteCardFormState();
}

bool showBackView = false;
String cardNumber = '';
String expiryDate = '';
String cardHolderName = '';
String cvvCode = '';
Color themeColor = Colors.red;
GlobalKey<FormState> formKey = GlobalKey();
AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;

class _CrediteCardFormState extends State<CrediteCardForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          isHolderNameVisible: true,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (value) {},
        ),
        CreditCardForm(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          themeColor: themeColor,
          formKey: formKey,
          autovalidateMode: autovalidateMode,
          onCreditCardModelChange: (creditCardModel) {
            cardNumber = creditCardModel.cardNumber;
            cvvCode = creditCardModel.cvvCode;
            expiryDate = creditCardModel.expiryDate;
            cardHolderName = creditCardModel.cardHolderName;
            showBackView = creditCardModel.isCvvFocused;
            setState(() {});
          },
        ),
        const SizedBox(
          height: 30,
        ),
        CustomizeCheckoutButton(
          
          hight: 73,
          title: "Pay",
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
            } else {
              autovalidateMode = AutovalidateMode.always;
              setState(() {});
            }
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const ThankYouScreen();
              },
            ));
          },
          width: 350,
          background: const Color(0xff34A853),
        )
      ],
    );
  }
}
 