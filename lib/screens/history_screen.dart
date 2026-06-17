import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siptime/widgets/bottom_navigation_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('기록')),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
      body: Center(),
    );
  }
}
