import 'package:flutter/material.dart';
import 'package:siptime/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int goal = 2000;
  int totalWater = 0;
  double _animatedProgress = 0;

  final List<Map<String, dynamic>> records = [];

  void addWater(int amount) {
    setState(() {
      totalWater += amount;

      _animatedProgress = totalWater / goal;

      records.insert(0, {
        "amount": amount,
        "time": TimeOfDay.now().format(context),
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final progress = totalWater / goal;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(centerTitle: true, title: const Text("SipTime")),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(height: 10),

            Column(
              children: [
                const Text("오늘의 목표", textAlign: TextAlign.center),

                if (totalWater >= goal) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "목표 달성!",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ],
            ),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$goal",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  'mL',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$totalWater",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  'mL',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: _animatedProgress.clamp(0, 1)),
              duration: const Duration(milliseconds: 200),
              builder: (context, value, child) {
                return LinearProgressIndicator(
                  value: value,
                  minHeight: 12,
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff4a90e2),
                  backgroundColor: const Color.fromARGB(116, 140, 201, 255),
                );
              },
            ),

            const SizedBox(height: 32),

            const Text(
              "빠른 추가",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _quickButton(100),
                _quickButton(200),
                _quickButton(300),
                _quickButton(500),
              ],
            ),

            const SizedBox(height: 32),

            const Text(
              "최근 기록",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color.fromARGB(43, 0, 0, 0)),
              ),
              child: records.isEmpty
                  ? const SizedBox(
                      height: 120,
                      child: Center(
                        child: Text(
                          '아직 물을 마시지 않았습니다',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                    )
                  : Column(
                      children: records.take(10).map((record) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6F2FF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${record["amount"]}mL",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(record["time"]),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quickButton(int amount) {
    return ElevatedButton(
      onPressed: () => addWater(amount),
      child: Text(
        "${amount}mL",
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(80, 40), // 가로 80, 세로 50
        padding: EdgeInsets.zero,
        backgroundColor: Color(0xffe6f2ff),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
