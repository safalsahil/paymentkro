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
      icon: Icons.phone_android_rounded,
      title: 'Mobile Recharge',
      subtitle: '98765 43210 · Today, 10:24 AM',
      amount: '₹299',
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
