import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();

    // 2초 동안 스플래시 유지
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      setState(() {
        _opacity = 0.0;
      });
    });

    // 3초 후 메인 화면으로 이동
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;

      context.go('/main');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
          
              Image.asset('assets/img/siptime_logo.png', width: 230),
          
              const SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
