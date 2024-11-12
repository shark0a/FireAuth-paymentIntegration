import 'package:authtest/Feature/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:authtest/Feature/auth/presentation/screens/widgets/customize_button.dart';
import 'package:authtest/Feature/auth/presentation/screens/widgets/verification/build_phone_number_text.dart';
import 'package:authtest/Feature/auth/presentation/screens/widgets/verification/build_resend_code_button.dart';
import 'package:authtest/core/Routers/app_routers.dart';
import 'package:authtest/core/styles/font_styles.dart';
import 'package:authtest/core/styles/fonts/font_colors.dart';
import 'package:authtest/core/utils/shared_prefrance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:go_router/go_router.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String? emailAdress;
  String otpCode = "";
  String? verificationId;

  @override
  void initState() {
    super.initState();
    _loadPhoneNumberAndVerificationId();
  }

  Future<void> _loadPhoneNumberAndVerificationId() async {
    emailAdress = await SharedPrefHelper.getData("EmailAddress");
    verificationId = await SharedPrefHelper.getData("verificationId");
    setState(() {
      emailAdress;
      verificationId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Mobile Number Verification",
          style: FontStyles.titlestyle.copyWith(fontSize: 20),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: FontColors.primaryColor),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset("lib/core/assets/images/2.jpg"),
              BuildPhoneNumberText(emailAddress: emailAdress),
              const SizedBox(height: 25),
              VerificationCode(
                fullBorder: true,
                keyboardType: TextInputType.number,
                length: 6,
                underlineUnfocusedColor: FontColors.secColor,
                digitsOnly: true,
                onCompleted: (value) {
                  otpCode = value;
                },
                onEditing: (value) {},
              ),
              const SizedBox(height: 25),
              const BuildResendCodeButton(),
              const SizedBox(height: 20),
              CustomizeButton(
                ontap: () async {
                  final authCubit = BlocProvider.of<AuthCubit>(context);

                  if (authCubit.vCode == otpCode.trim()) {
                    // Future.delayed(const Duration(milliseconds: 100));
                    await GoRouter.of(context)
                        .pushReplacement(AppRouter.kCompletedScreen);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("sign in successfuly")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Check your code")),
                    );
                  }
                },
                title: "Verify",
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
