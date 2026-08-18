import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/AppColors.dart';

import 'DashboardScreen.dart';

class OtpScreen extends StatefulWidget {
  final String mobileNumber;

  const OtpScreen({super.key, required this.mobileNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  static const int _otpLength = 6;
  static const int _resendSeconds = 30;

  final List<TextEditingController> _controllers =
  List.generate(_otpLength, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(_otpLength, (_) => FocusNode());

  Timer? _timer;
  int _secondsLeft = _resendSeconds;
  bool _isVerifying = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsLeft = _resendSeconds;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft == 0) {
        timer.cancel();
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  String get _enteredOtp => _controllers.map((c) => c.text).join();

  void _onChanged(int index, String value) {
    setState(() => _errorText = null);

    if (value.isNotEmpty && index < _otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
    if (_enteredOtp.length == _otpLength) {
      FocusScope.of(context).unfocus();
      _verifyOtp();
    }
  }

  Future<void> _verifyOtp() async {
    if (_enteredOtp.length != _otpLength || _isVerifying) return;

    setState(() => _isVerifying = true);

    // TODO: replace with your actual verify-OTP API call
    await Future.delayed(const Duration(milliseconds: 900));

    if (!mounted) return;
    setState(() => _isVerifying = false);

    const bool isOtpCorrect = true; // wire this to your API response
    if (!isOtpCorrect) {
      setState(() => _errorText = 'Incorrect OTP. Please try again.');
      return;
    }

    // TODO: navigate to your home / dashboard screen
    // Navigator.of(context).pushAndRemoveUntil(
    //   MaterialPageRoute(builder: (_) => const DashboardScreen()),
    //       (route) => false,
    // );

  }

  void _resendOtp() {
    if (_secondsLeft != 0) return;
    for (final c in _controllers) {
      c.clear();
    }
    _focusNodes.first.requestFocus();
    _startTimer();
    // TODO: trigger resend-OTP API call
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Verify OTP',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 14.5, color: AppColors.grey, height: 1.5),
                  children: [
                    const TextSpan(text: 'Enter the 6-digit code sent to '),
                    TextSpan(
                      text: '+91 ${widget.mobileNumber}',
                      style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(_otpLength, (index) {
                  final bool hasError = _errorText != null;
                  return SizedBox(
                    width: 46,
                    height: 54,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.surfaceBlack,
                        counterText: '',
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: hasError ? AppColors.red : AppColors.border,
                            width: 1.4,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColors.red, width: 1.8),
                        ),
                      ),
                      onChanged: (value) => _onChanged(index, value),
                    ),
                  );
                }),
              ),
              if (_errorText != null) ...[
                const SizedBox(height: 12),
                Text(
                  _errorText!,
                  style: const TextStyle(color: AppColors.red, fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ],
              const SizedBox(height: 28),
              Row(
                children: [
                  Text(
                    _secondsLeft > 0
                        ? "Resend OTP in 0:${_secondsLeft.toString().padLeft(2, '0')}"
                        : "Didn't receive the code?",
                    style: const TextStyle(fontSize: 13.5, color: AppColors.grey),
                  ),
                  if (_secondsLeft == 0) ...[
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: _resendOtp,
                      child: const Text(
                        'Resend',
                        style: TextStyle(
                          fontSize: 13.5,
                          color: AppColors.red,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const DashboardScreen()));
                  }
                  // _isVerifying ? null : _verifyOtp
    ,
                  child: _isVerifying
                      ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.4,
                      valueColor: AlwaysStoppedAnimation(AppColors.white),
                    ),
                  )
                      : const Text(
                    'Verify & Continue',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}