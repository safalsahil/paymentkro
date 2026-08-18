import 'package:flutter/material.dart';
import '../constants/AppColors.dart';
import 'OtpScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isValid = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() => setState(() {}));
  }

  void _onChanged(String value) {
    setState(() => _isValid = value.length == 10);
  }

  Future<void> _onContinue() async {
    if (!_isValid || _isLoading) return;
    setState(() => _isLoading = true);

    // TODO: replace with your actual send-OTP API call
    await Future.delayed(const Duration(milliseconds: 900));

    if (!mounted) return;
    setState(() => _isLoading = false);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => OtpScreen(mobileNumber: _mobileController.text),
      ),
    );
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.surfaceBlack,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.border, width: 1),
                ),
                child: const Icon(Icons.bolt_rounded, color: AppColors.red, size: 34),
              ),
              const SizedBox(height: 28),
              const Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter your mobile number to continue with Paymentkro',
                style: TextStyle(fontSize: 14.5, color: AppColors.grey, height: 1.5),
              ),
              const SizedBox(height: 36),
              const Text(
                'Mobile Number',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceBlack,
                  border: Border.all(
                    color: _focusNode.hasFocus ? AppColors.red : AppColors.border,
                    width: 1.4,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    const Text('🇮🇳', style: TextStyle(fontSize: 20)),
                    const SizedBox(width: 8),
                    const Text(
                      '+91',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(width: 1, height: 26, color: AppColors.border),
                    Expanded(
                      child: TextField(
                        controller: _mobileController,
                        focusNode: _focusNode,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        onChanged: _onChanged,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: AppColors.white,
                        ),
                        decoration: const InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                          hintText: '98765 43210',
                          hintStyle: TextStyle(color: AppColors.grey, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isValid ? AppColors.red : AppColors.surfaceBlack2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  onPressed: _isValid ? _onContinue : null,
                  child: _isLoading
                      ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.4,
                      valueColor: AlwaysStoppedAnimation(AppColors.white),
                    ),
                  )
                      : Text(
                    'Send OTP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: _isValid ? AppColors.white : AppColors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(fontSize: 12.5, color: AppColors.grey, height: 1.5),
                    children: [
                      TextSpan(text: 'By continuing, you agree to our '),
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w600),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
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