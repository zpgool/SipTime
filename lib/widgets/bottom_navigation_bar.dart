import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              color: Colors.black.withOpacity(0.08),
            )
          ],
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth = constraints.maxWidth / 3;

            return Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  left: itemWidth * currentIndex + (itemWidth - 110) / 2,
                  top: 5,
                  child: Container(
                    width: 110,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 237, 237, 237),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),

                // 아이콘들
                Row(
                  children: [
                    _item(Icons.home, 0),
                    _item(Icons.article, 1),
                    _item(Icons.settings, 2),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _item(IconData icon, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.opaque,
        child: SizedBox(
          height: 70,
          child: Icon(
            icon,
            color: currentIndex == index
                ? const Color(0xFF4a90e2)
                : Colors.grey,
            size: 26,
          ),
        ),
      ),
    );
  }
}