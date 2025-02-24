import 'dart:async';

import 'package:flutter/material.dart';

class OtpProvider extends ChangeNotifier {
  // otp controller
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();
  final TextEditingController _otpController5 = TextEditingController();

  // otp controller getter
  TextEditingController get otpController1 => _otpController1;
  TextEditingController get otpController2 => _otpController2;
  TextEditingController get otpController3 => _otpController3;
  TextEditingController get otpController4 => _otpController4;
  TextEditingController get otpController5 => _otpController5;

  //
  // count down time in otp modal bottom sheet
  int _remainingTime = 15;

  int get remainingTimer => _remainingTime;

  Timer? _timer;

  bool _showResendCode = false;

  bool get showResendCode => _showResendCode;

  void _runTimer() {
    if (_remainingTime > 0) {
      _timer = Timer(Duration(seconds: 1), () {
        _remainingTime -= 1;
        notifyListeners();
        _runTimer();
      });
    } else {
      _showResendCode = true;
      notifyListeners();
      _dispose();
    }
  }

  void startTimer() {
    //TODO: handle this method by using if conditions
    _remainingTime = 15;
    _showResendCode = false;
    notifyListeners();
    _dispose();
    _runTimer();
  }

  void _dispose() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }
}
