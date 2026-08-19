import 'package:flutter/material.dart';
import 'package:payment_karo/screens/profile_screen.dart';
import 'package:payment_karo/screens/search_rechrge_screen.dart';
import '../constants/AppColors.dart';
import 'bill_screen.dart';

class _QuickAction {
  final Image image;
  final String label;

  const _QuickAction({required this.image, required this.label});
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

  final List<_QuickAction> _quickActionsMobile = const [
    _QuickAction(
      image: Image(
        image: AssetImage('lib/assets/icons/vI.png'),
        fit: BoxFit.fill,
      ),
      label: "VI",
    ),
    _QuickAction(
      image: Image(image: AssetImage('lib/assets/icons/bsnlimg.png')),
      label: "BSNL",
    ),

    _QuickAction(
      image: Image(image: AssetImage('lib/assets/icons/airtel.png')),
      label: 'Airtel',
    ),
    _QuickAction(
      image: Image(image: AssetImage('lib/assets/icons/jio.png')),
      label: 'Jio',
    ),
  ];
  final List<_QuickAction> _quickActionsDishes = const [


    _QuickAction(
      image: Image(image: AssetImage('lib/assets/icons/dishtv.png')),
      label: 'DTH',
    ),
    _QuickAction(
      image: Image(image: AssetImage('lib/assets/icons/airtel.png')),
      label: 'Airtel',
    ),
    _QuickAction(
      image: Image(image: AssetImage('lib/assets/icons/jiofiber.png')),
      label: 'JioFiber',
    ),
    _QuickAction(
      image: Image(image: AssetImage('lib/assets/icons/sundirect.png')),
      label: 'Sun Direct',
    ),
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
          const BillScreen(),
          const ProfileScreen(),
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
            _buildSectionHeader('Mobile Recharge'),
            const SizedBox(height: 14),
            _buildQuickActionsGridMobile(),
            const SizedBox(height: 28),
            _buildSectionHeader('Dish Recharge'),
            const SizedBox(height: 14),
            _buildQuickActionsGridDishes(),
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
  Widget _buildQuickActionsGridDishes() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _quickActionsDishes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 18,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final action = _quickActionsDishes[index];
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border, width: 1),
                ),
                padding: const EdgeInsets.all(8),
                child: action.image,
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

  Widget _buildQuickActionsGridMobile() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _quickActionsMobile.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 18,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final action = _quickActionsMobile[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RechargePlansScreen(operatorName: '',)),
            );
          },
          borderRadius: BorderRadius.circular(16),
          child: Column(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border, width: 1),
                ),
                padding: const EdgeInsets.all(8),
                child: action.image,
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

  Widget _buildBottomNav() {
    final items = const [
      (icon: Icons.home_rounded, label: 'Home'),
      (icon: Icons.receipt_long_rounded, label: 'Bills'),
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
