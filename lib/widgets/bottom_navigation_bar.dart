import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 10, color: const Color.fromARGB(58, 0, 0, 0))],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(
              context,
              icon: Icons.home,
              label: '홈',
              index: 0,
              path: '/',
            ),
            _navItem(
              context,
              icon: Icons.article,
              label: '기록',
              index: 1,
              path: '/history',
            ),
            _navItem(
              context,
              icon: Icons.settings,
              label: '설정',
              index: 2,
              path: '/settings',
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required int index,
    required String path,
  }) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => context.go(path),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? const Color(0xFF4a90e2) : Colors.grey, size: 25,),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
