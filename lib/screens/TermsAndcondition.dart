import 'package:flutter/material.dart';
import '../constants/AppColors.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState
    extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          "Terms & Conditions",
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Terms & Conditions",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Last updated: August 2026",
              style: TextStyle(
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Welcome to Payment Kro.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "By using the Payment Kro application, you agree to "
              "the following Terms & Conditions. Please read them "
              "carefully before using our services.",
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "1. Account Responsibility",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "You are responsible for maintaining the security of "
              "your account and login information. You should not "
              "share your account credentials with anyone.",
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "2. Payments",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Please verify the payment details before confirming "
              "a transaction. Payment Kro is not responsible for "
              "incorrect information entered by the user.",
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "3. User Conduct",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Users must not use Payment Kro for illegal, fraudulent, "
              "unauthorized, or harmful activities.",
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "4. Service Availability",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Payment Kro may temporarily suspend or modify services "
              "for maintenance, updates, or technical reasons.",
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "5. Privacy",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Your personal information will be handled according "
              "to our Privacy Policy and applicable laws.",
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "6. Changes to Terms",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Payment Kro may update these Terms & Conditions from "
              "time to time. Continued use of the application after "
              "changes means that you accept the updated terms.",
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "By using Payment Kro, you agree to these Terms & Conditions.",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 1.5,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: FloatingActionButton.extended(
          backgroundColor: AppColors.red,
          onPressed: () {
            Navigator.pop(context);
          },
          label: const Text(
            "Confirmed",
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
