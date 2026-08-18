import 'package:flutter/material.dart';
import '../constants/AppColors.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({super.key});

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _Transaction {
  final IconData icon;
  final String title;
  final String subtitle;
  final String amount;
  final bool isDebit;

  const _Transaction({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.amount,
    this.isDebit = true,
  });
}

class _BillScreenState extends State<BillScreen> {
  final List<_Transaction> _transactions = const [
    _Transaction(
      icon: Icons.phone_android_rounded,
      title: 'Mobile Recharge',
      subtitle: '98765 43210 · Today, 10:24 AM',
      amount: '₹299',
    ),
    _Transaction(
      icon: Icons.bolt_rounded,
      title: 'Electricity Bill',
      subtitle: 'PSPCL · Yesterday, 6:10 PM',
      amount: '₹1,450',
    ),
    _Transaction(
      icon: Icons.account_balance_wallet_rounded,
      title: 'Wallet Added',
      subtitle: 'via UPI · 10 Aug, 2:30 PM',
      amount: '₹500',
      isDebit: false,
    ),
    _Transaction(
      icon: Icons.live_tv_rounded,
      title: 'DTH Recharge',
      subtitle: 'Tata Play · 08 Aug, 9:00 AM',
      amount: '₹349',
    ),
    _Transaction(
      icon: Icons.wifi_rounded,
      title: 'Broadband Bill',
      subtitle: 'Airtel Xstream · 05 Aug, 11:45 AM',
      amount: '₹999',
    ),
    _Transaction(
      icon: Icons.water_drop_rounded,
      title: 'Water Bill',
      subtitle: 'Municipal Corp · 01 Aug, 04:20 PM',
      amount: '₹450',
    ),
    _Transaction(
      icon: Icons.local_fire_department_rounded,
      title: 'Gas Bill',
      subtitle: 'Indane Gas · 28 Jul, 12:15 PM',
      amount: '₹1,050',
    ),
    _Transaction(
      icon: Icons.security_rounded,
      title: 'Insurance Premium',
      subtitle: 'LIC · 25 Jul, 10:00 AM',
      amount: '₹2,500',
    ),
    _Transaction(
      icon: Icons.credit_card_rounded,
      title: 'Credit Card Bill',
      subtitle: 'HDFC Bank · 20 Jul, 03:45 PM',
      amount: '₹5,200',
    ),
    _Transaction(
      icon: Icons.card_giftcard_rounded,
      title: 'Cashback Received',
      subtitle: 'from Google Pay · 15 Jul, 06:20 PM',
      amount: '₹50',
      isDebit: false,
    ),
    _Transaction(
      icon: Icons.subscriptions_rounded,
      title: 'Netflix Subscription',
      subtitle: 'Premium Plan · 12 Jul, 08:00 AM',
      amount: '₹649',
    ),
    _Transaction(
      icon: Icons.shopping_bag_rounded,
      title: 'Amazon Shopping',
      subtitle: 'Order #405-1234 · 10 Jul, 02:30 PM',
      amount: '₹1,899',
    ),
    _Transaction(
      icon: Icons.restaurant_rounded,
      title: 'Zomato',
      subtitle: 'Dinner Order · 08 Jul, 09:15 PM',
      amount: '₹420',
    ),
    _Transaction(
      icon: Icons.shopping_cart_rounded,
      title: 'Grocery Store',
      subtitle: 'BigBasket · 05 Jul, 11:00 AM',
      amount: '₹1,250',
    ),
    _Transaction(
      icon: Icons.home_rounded,
      title: 'House Rent',
      subtitle: 'Sent to Landlord · 01 Jul, 10:00 AM',
      amount: '₹12,000',
    ),
    _Transaction(
      icon: Icons.directions_car_rounded,
      title: 'Petrol Bill',
      subtitle: 'HP Petrol Pump · 28 Jun, 05:30 PM',
      amount: '₹2,000',
    ),
    _Transaction(
      icon: Icons.medical_services_rounded,
      title: 'Pharmacy',
      subtitle: 'Apollo Pharmacy · 25 Jun, 02:15 PM',
      amount: '₹850',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Bills & History",
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        itemCount: _transactions.length,
        itemBuilder: (context, index) {
          return _buildTransactionTile(_transactions[index]);
        },
      ),
    );
  }

  Widget _buildTransactionTile(_Transaction tx) {
    final Color amountColor = tx.isDebit ? AppColors.white : const Color(0xFF35C46A);
    final String amountPrefix = tx.isDebit ? '-' : '+';

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.surfaceBlack,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border, width: 1),
            ),
            child: Icon(tx.icon, color: AppColors.red, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  tx.subtitle,
                  style: const TextStyle(fontSize: 12, color: AppColors.grey),
                ),
              ],
            ),
          ),
          Text(
            '$amountPrefix${tx.amount}',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }
}
