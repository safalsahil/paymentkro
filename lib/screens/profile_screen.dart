import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payment_karo/screens/Aboutus.dart';
import 'package:payment_karo/screens/login_screen.dart';
import '../constants/AppColors.dart';
import 'Privacy_Policy.dart';
import 'TermsAndcondition.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  File? profileImage;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }



  void logout() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.surfaceBlack,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("Logout", style: TextStyle(color: AppColors.white)),
          content: const Text("Are you sure you want to logout?",
              style: TextStyle(color: AppColors.grey)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: AppColors.grey)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: const Text("Logout", style: TextStyle(color: AppColors.red)),
            ),
          ],
        );
      },
    );
  }

  // Helper to pick image from camera or gallery with proper constraints
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await picker.pickImage(
        source: source,
        maxWidth: 512,  // Standard resolution for profile pictures
        maxHeight: 512,
        imageQuality: 75, // Reduce file size without visible quality loss
      );

      if (image != null) {
        setState(() {
          profileImage = File(image.path);
        });
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.red,
            content: Text("Error picking image: $e"),
          ),
        );
      }
    }
  }

  // Proper UI for selecting image source
  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surfaceBlack,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Choose Profile Photo",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _imageSourceItem(
                      icon: Icons.camera_alt_rounded,
                      label: "Camera",
                      onTap: () {
                        Navigator.pop(context);
                        _pickImage(ImageSource.camera);
                      },
                    ),
                    _imageSourceItem(
                      icon: Icons.photo_library_rounded,
                      label: "Gallery",
                      onTap: () {
                        Navigator.pop(context);
                        _pickImage(ImageSource.gallery);
                      },
                    ),
                    if (profileImage != null)
                      _imageSourceItem(
                        icon: Icons.delete_outline_rounded,
                        label: "Remove",
                        onTap: () {
                          setState(() {
                            profileImage = null;
                          });
                          Navigator.pop(context);
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _imageSourceItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.background,
                border: Border.all(color: AppColors.border),
              ),
              child: Icon(icon, color: AppColors.red, size: 28),
            ),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(color: AppColors.white, fontSize: 13)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout, color: AppColors.red),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: _showImageSourceDialog,
                    child: Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.surfaceBlack,
                        border: Border.all(color: AppColors.border, width: 2),
                        image: profileImage != null
                            ? DecorationImage(
                                image: FileImage(profileImage!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: profileImage == null
                          ? const Icon(Icons.person, size: 70, color: AppColors.red)
                          : null,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _showImageSourceDialog,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: AppColors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt_rounded, size: 18, color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Safal",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "safal@gmail.com",
              style: TextStyle(fontSize: 14, color: AppColors.grey),
            ),
            const SizedBox(height: 32),
            _buildProfileOption(
              icon: Icons.help_outline_rounded,
              title: "Help & Support",
              onTap: showHelpSupportDialog,
            ),
            const Divider(color: AppColors.border, height: 1),
            _buildProfileOption(
              icon: Icons.description_outlined,
              title: "Terms & Conditions",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TermsAndConditionsScreen()),
                );
              },
            ),
            const Divider(color: AppColors.border, height: 1),
            _buildProfileOption(
              icon: Icons.privacy_tip_outlined,
              title: "Privacy Policy",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()),
                );
              },
            ),
            const Divider(color: AppColors.border, height: 1),
            _buildProfileOption(
              icon: Icons.info_outline_rounded,
              title: "About Us",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUsScreen()),
                );
              },
            ),
            const Divider(color: AppColors.border, height: 1),
            _buildProfileOption(
              icon: Icons.logout_rounded,
              title: "Logout",
              titleColor: AppColors.red,
              iconColor: AppColors.red,
              onTap: logout,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color titleColor = AppColors.white,
    Color iconColor = AppColors.grey,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.surfaceBlack,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppColors.grey),
      onTap: onTap,
    );
  }

  void showHelpSupportDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.surfaceBlack,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Row(
            children: [
              Icon(Icons.support_agent_rounded, color: AppColors.red),
              SizedBox(width: 12),
              Text("Help & Support", style: TextStyle(color: AppColors.white)),
            ],
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Need help?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white),
              ),
              SizedBox(height: 10),
              Text(
                "If you are facing any issue, please contact our support team.",
                style: TextStyle(color: AppColors.grey),
              ),
              SizedBox(height: 20),
              Text("Email: support@paymentkro.com", style: TextStyle(color: AppColors.white)),
              SizedBox(height: 8),
              Text("Phone: +91 98765 43210", style: TextStyle(color: AppColors.white)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close", style: TextStyle(color: AppColors.red)),
            ),
          ],
        );
      },
    );
  }
}
