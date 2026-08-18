import 'package:flutter/material.dart';
import '../constants/AppColors.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          "About Us",
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
            const Center(
              child: Text(
                "Payment Kro",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "Version 1.0.0",
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "About Payment Kro",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Payment Kro is a simple and user-friendly payment "
              "application designed to make digital payments easier "
              "and more convenient.\n\n"
              "Our goal is to provide users with a smooth and reliable "
              "experience while managing their payment activities.",
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Our Mission",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Our mission is to make digital payments simple, "
              "accessible, and convenient for everyone. We aim to "
              "provide an easy-to-use platform with a focus on "
              "simplicity and a better user experience.",
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Why Payment Kro?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "• Simple and easy-to-use interface\n"
              "• Convenient payment experience\n"
              "• Easy account management\n"
              "• User-friendly design\n"
              "• Dedicated support",
              style: TextStyle(
                fontSize: 15,
                height: 1.8,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                "Thank you for choosing Payment Kro!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: FloatingActionButton.extended(
            backgroundColor: AppColors.red,
            elevation: 0,
            onPressed: () => Navigator.pop(context),
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
      ),
    );
  }
}
