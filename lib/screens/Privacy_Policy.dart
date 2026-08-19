import 'package:flutter/material.dart';
import '../constants/AppColors.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          "Privacy Policy",
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
            // Title
            const Text(
              "Privacy Policy",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Last updated: August 2026",
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Welcome to Payment Kro",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Payment Kro respects your privacy and is committed to "
              "protecting your personal information. This Privacy Policy "
              "explains how we collect, use, and protect information when "
              "you use our application.",
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: AppColors.grey,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "1. Information We Collect",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "We may collect basic information such as your name, "
              "email address, phone number, and account information "
              "required to provide our services.",
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: AppColors.grey,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "2. How We Use Your Information",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Your information may be used to create and manage your "
              "account, provide payment services, improve the application, "
              "and communicate with you regarding your account or services.",
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: AppColors.grey,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "3. Payment Information",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Payment information may be processed through secure "
              "third-party payment providers. Payment Kro does not "
              "intentionally store sensitive payment information unless "
              "required to provide the service.",
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: AppColors.grey,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "4. Data Security",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "We take reasonable measures to protect your personal "
              "information from unauthorized access, misuse, alteration, "
              "or disclosure.",
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: AppColors.grey,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "5. Third-Party Services",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Payment Kro may use third-party services for authentication, "
              "payments, analytics, hosting, or other application features. "
              "These services may have their own privacy policies.",
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: AppColors.grey,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "6. Your Rights",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "You may contact us if you have questions about your personal "
              "information or want to request changes to your account information.",
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: AppColors.grey,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "7. Changes to This Privacy Policy",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "We may update this Privacy Policy from time to time. "
              "Any changes will be reflected in the application.",
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: AppColors.grey,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "If you have any questions about this Privacy Policy, "
              "please contact our support team.",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                height: 1.6,
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
