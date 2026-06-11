import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('홈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/history'),
              child: const Text('기록 화면으로 이동'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/settings'),
              child: const Text('설정 화면으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}