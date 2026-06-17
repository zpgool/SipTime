import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/water_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WaterProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text("설정"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "목표 설정",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "하루 목표 섭취량",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: const Color(0xfff3f3f3),
                        child: IconButton(
                          onPressed: () {
                            context.read<WaterProvider>().decreaseGoal();
                          },
                          icon: const Icon(Icons.remove, color: Colors.black),
                        ),
                      ),

                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${provider.goal}",
                              style: const TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff4A90E2),
                              ),
                            ),
                            const TextSpan(
                              text: " mL",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff4A90E2),
                              ),
                            ),
                          ],
                        ),
                      ),

                      CircleAvatar(
                        radius: 24,
                        backgroundColor: const Color(0xfff3f3f3),
                        child: IconButton(
                          onPressed: () {
                            context.read<WaterProvider>().increaseGoal();
                          },
                          icon: const Icon(Icons.add, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
