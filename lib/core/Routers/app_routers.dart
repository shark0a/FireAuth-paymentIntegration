import 'package:authtest/Feature/auth/presentation/screens/completed_screen.dart';
import 'package:authtest/Feature/auth/presentation/screens/login_screen.dart';
import 'package:authtest/Feature/auth/presentation/screens/signup_screens.dart';
import 'package:authtest/Feature/auth/presentation/screens/verification_screen.dart';
import 'package:authtest/Feature/cart/presentation/screens/my_cart_screen.dart';
import 'package:authtest/Feature/cart/presentation/screens/payment_details_screen.dart';
import 'package:authtest/Feature/cart/presentation/screens/thank_you_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLoginScreen = '/';
  static const kVerificationScreen = '/verificationscreen';
  static const kCompletedScreen = '/completedscreen';
  static const kSignScreen = '/signupscreen';
  static const kCartScreen = '/cartscreen';
  static const kPaymentDetailsScreen = '/paymentdetailsscreen';
  static const kThankYouScreen = '/thankyouscreen';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: AppRouter.kVerificationScreen,
      builder: (context, state) => const VerificationScreen(),
    ),
    GoRoute(
      path: AppRouter.kCompletedScreen,
      builder: (context, state) => CompletedScreen(),
    ),
    GoRoute(
      path: AppRouter.kSignScreen,
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: AppRouter.kCartScreen,
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: AppRouter.kPaymentDetailsScreen,
      builder: (context, state) => const PaymentDetailsScreen(),
    ),
    GoRoute(
      path: AppRouter.kThankYouScreen,
      builder: (context, state) => const ThankYouScreen(),
    ),
  ]);
}
