import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:siptime/widgets/bottom_navigation_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('설정')),
      body: Padding(
        padding: EdgeInsets.all(20),
        
      ),
    );
  }
}
