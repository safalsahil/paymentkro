import 'package:flutter/material.dart';
import '../constants/AppColors.dart';

class RechargePlansScreen extends StatefulWidget {
  final String operatorName;
  const RechargePlansScreen({super.key, required this.operatorName});

  @override
  State<RechargePlansScreen> createState() => _RechargePlansScreenState();
}

class _RechargePlansScreenState extends State<RechargePlansScreen> {
  final TextEditingController mobileController =
      TextEditingController(text: "9876543210");

  late String operatorName;
  String location = "Punjab";
  bool showPlans = false;

  final List<Map<String, String>> plans = [
    {
      "price": "₹199",
      "validity": "18 Days",
      "data": "1.5 GB/Day",
      "description": "Unlimited Calls + 100 SMS/Day",
    },
    {
      "price": "₹299",
      "validity": "28 Days",
      "data": "1.5 GB/Day",
      "description": "Unlimited Calls + 100 SMS/Day",
    },
    {
      "price": "₹349",
      "validity": "28 Days",
      "data": "2 GB/Day",
      "description": "Unlimited Calls + 100 SMS/Day",
    },
    {
      "price": "₹599",
      "validity": "56 Days",
      "data": "1.5 GB/Day",
      "description": "Unlimited Calls + 100 SMS/Day",
    },
    {
      "price": "₹799",
      "validity": "84 Days",
      "data": "1.5 GB/Day",
      "description": "Unlimited Calls + 100 SMS/Day",
    },
  ];

  @override
  void initState() {
    super.initState();
    operatorName = widget.operatorName;
  }

  void searchPlans() {
    setState(() {
      showPlans = true;
    });
  }

  void changeNumber() {
    showDialog(
      context: context,
      builder: (context) {
        final controller = TextEditingController(text: mobileController.text);
        return AlertDialog(
          backgroundColor: AppColors.surfaceBlack,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("Change Number", style: TextStyle(color: AppColors.white)),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.phone,
            maxLength: 10,
            style: const TextStyle(color: AppColors.white),
            decoration: const InputDecoration(
              hintText: "Enter mobile number",
              hintStyle: TextStyle(color: AppColors.grey),
              prefixIcon: Icon(Icons.phone, color: AppColors.red),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.border)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.red)),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: AppColors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                if (controller.text.length == 10) {
                  setState(() {
                    mobileController.text = controller.text;
                    showPlans = false;
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text("Change", style: TextStyle(color: AppColors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          "Recharge Plans",
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Mobile Number Container
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surfaceBlack,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.phone_android, color: AppColors.red),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Mobile Number",
                          style: TextStyle(color: AppColors.grey, fontSize: 13),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          mobileController.text,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: changeNumber,
                    child: const Text("Change", style: TextStyle(color: AppColors.red)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Operator & Location Container
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surfaceBlack,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  const Icon(Icons.signal_cellular_alt, color: AppColors.red, size: 20),
                  const SizedBox(width: 12),
                  Text(
                    operatorName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.white),
                  ),
                  const Spacer(),
                  const Icon(Icons.location_on_outlined, size: 20, color: AppColors.grey),
                  const SizedBox(width: 5),
                  Text(location, style: const TextStyle(color: AppColors.white)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Search Plans Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                onPressed: searchPlans,
                icon: const Icon(Icons.search, color: AppColors.white),
                label: const Text(
                  "Search Plans",
                  style: TextStyle(fontSize: 16, color: AppColors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Plans List
            if (showPlans)
              Expanded(
                child: ListView.builder(
                  itemCount: plans.length,
                  itemBuilder: (context, index) {
                    final plan = plans[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceBlack,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                plan["price"]!,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                              const Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.red,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: AppColors.surfaceBlack,
                                      content: Text(
                                        "${plan["price"]} plan selected",
                                        style: const TextStyle(color: AppColors.white),
                                      ),
                                    ),
                                  );
                                },
                                child: const Text("Recharge", style: TextStyle(color: AppColors.white)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today_outlined,
                                  size: 18, color: AppColors.grey),
                              const SizedBox(width: 6),
                              Text(
                                "Validity: ${plan["validity"]}",
                                style: const TextStyle(color: AppColors.white),
                              ),
                              const SizedBox(width: 20),
                              const Icon(Icons.data_usage, size: 18, color: AppColors.grey),
                              const SizedBox(width: 6),
                              Text(
                                plan["data"]!,
                                style: const TextStyle(color: AppColors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            plan["description"]!,
                            style: const TextStyle(color: AppColors.grey),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
