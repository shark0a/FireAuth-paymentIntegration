import 'dart:developer';

import 'package:authtest/Feature/cart/data/models/payment_intinet_input_model.dart';
import 'package:authtest/Feature/cart/presentation/repo/checkout_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this._checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo _checkoutRepo;
  Future paymentMethod(
      {required PaymentIntinetInputModel paymentIntinetInputModel}) async {
    emit(PaymentLoading());

    var data = await _checkoutRepo.makePayment(
        paymentIntinetInputModel: paymentIntinetInputModel);
    data.fold(
      (le) {
        emit(
          PaymentFaluire(
            errMessage: le.errMessage.toString(),
          ),
        );
      },
      (ri) {
        emit(PaymentSuccess());
      },
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
