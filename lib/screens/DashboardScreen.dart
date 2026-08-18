import 'package:flutter/material.dart';
import '../constants/AppColors.dart';
import 'bill_screen.dart';

class _QuickAction {
  final IconData icon;
  final String label;

  const _QuickAction({required this.icon, required this.label});
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

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _navIndex = 0;

  final List<_QuickAction> _quickActions = const [
    _QuickAction(icon: Icons.phone_android_rounded, label: 'Mobile'),
    _QuickAction(icon: Icons.live_tv_rounded, label: 'DTH'),
    _QuickAction(icon: Icons.bolt_rounded, label: 'Electricity'),
    _QuickAction(icon: Icons.wifi_rounded, label: 'Broadband'),
    _QuickAction(icon: Icons.local_gas_station_rounded, label: 'Gas'),
    _QuickAction(icon: Icons.water_drop_rounded, label: 'Water'),
    _QuickAction(icon: Icons.credit_card_rounded, label: 'Card Bill'),
    _QuickAction(icon: Icons.apps_rounded, label: 'More'),
  ];

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(
        index: _navIndex,
        children: [
          _buildHomeView(),
          BillScreen(),
          const Center(child: Text('Wallet', style: TextStyle(color: Colors.white))),
          const Center(child: Text('Profile', style: TextStyle(color: Colors.white))),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHomeView() {
    return SafeArea(
      child: RefreshIndicator(
        color: AppColors.red,
        backgroundColor: AppColors.surfaceBlack,
        onRefresh: () async {
          await Future.delayed(const Duration(milliseconds: 800));
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            _buildTopBar(),
            const SizedBox(height: 20),
            _buildBalanceCard(),
            const SizedBox(height: 28),
            _buildSectionHeader('Quick Actions'),
            const SizedBox(height: 14),
            _buildQuickActionsGrid(),
            const SizedBox(height: 28),
            _buildPromoBanner(),
            const SizedBox(height: 28),
            _buildSectionHeader('Recent Transactions', actionLabel: 'See all'),
            const SizedBox(height: 12),
            ..._transactions.map(_buildTransactionTile),
          ],
        ),
      ),
    );
  }

  // ---------- Top bar ----------
  Widget _buildTopBar() {
    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: AppColors.surfaceBlack,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.border, width: 1),
          ),
          alignment: Alignment.center,
          child: const Text(
            'S',
            style: TextStyle(
              color: AppColors.red,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good afternoon 👋',
                style: TextStyle(fontSize: 12.5, color: AppColors.grey),
              ),
              SizedBox(height: 2),
              Text(
                'Safal',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
        _iconButton(Icons.notifications_none_rounded, onTap: () {}),
      ],
    );
  }

  Widget _iconButton(IconData icon, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 46,
        height: 46,
        decoration: BoxDecoration(
          color: AppColors.surfaceBlack,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border, width: 1),
        ),
        child: Stack(
          children: [
            Center(child: Icon(icon, color: AppColors.white, size: 22)),
            Positioned(
              top: 11,
              right: 11,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- Balance card ----------
  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.red, AppColors.redDark],
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.red.withOpacity(0.25),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Wallet Balance',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Paymentkro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            '₹2,480.00',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _balanceButton(
                  icon: Icons.add_rounded,
                  label: 'Add Money',
                  filled: true,
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _balanceButton(
                  icon: Icons.history_rounded,
                  label: 'History',
                  filled: false,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _balanceButton({
    required IconData icon,
    required String label,
    required bool filled,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: filled ? AppColors.black : Colors.transparent,
          border: filled ? null : Border.all(color: Colors.white54, width: 1.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 17, color: Colors.white),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- Section header ----------
  Widget _buildSectionHeader(String title, {String? actionLabel}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16.5,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
        if (actionLabel != null)
          Text(
            actionLabel,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.red,
            ),
          ),
      ],
    );
  }

  // ---------- Quick actions grid ----------
  Widget _buildQuickActionsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _quickActions.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 18,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final action = _quickActions[index];
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.surfaceBlack,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border, width: 1),
                ),
                child: Icon(action.icon, color: AppColors.red, size: 24),
              ),
              const SizedBox(height: 8),
              Text(
                action.label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 11.5,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ---------- Promo banner ----------
  Widget _buildPromoBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surfaceBlack,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.red.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.local_offer_rounded, color: AppColors.red, size: 22),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get 5% cashback',
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'On your first recharge this week',
                  style: TextStyle(fontSize: 12.5, color: AppColors.grey),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.grey),
        ],
      ),
    );
  }

  // ---------- Transactions ----------
  Widget _buildTransactionTile(_Transaction tx) {
    final Color amountColor = tx.isDebit ? AppColors.white : const Color(0xFF35C46A);
    final String amountPrefix = tx.isDebit ? '-' : '+';

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.surfaceBlack,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border, width: 1),
            ),
            child: Icon(tx.icon, color: AppColors.red, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 3),
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
              fontSize: 14.5,
              fontWeight: FontWeight.w700,
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }

  // ---------- Bottom nav ----------
  Widget _buildBottomNav() {
    final items = const [
      (icon: Icons.home_rounded, label: 'Home'),
      (icon: Icons.receipt_long_rounded, label: 'Bills'),
      (icon: Icons.account_balance_wallet_rounded, label: 'Wallet'),
      (icon: Icons.person_outline_rounded, label: 'Profile'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceBlack,
        border: Border(top: BorderSide(color: AppColors.border, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final selected = _navIndex == index;
            final item = items[index];
            return InkWell(
              onTap: () {
                setState(() => _navIndex = index);
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      size: 23,
                      color: selected ? AppColors.red : AppColors.grey,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: selected ? AppColors.red : AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
