import 'package:flutter/material.dart';

enum BottomTab { home, receipts, favorites, help }

class AppBottomBar extends StatelessWidget {
  final BottomTab activeTab;
  final Function(BottomTab)? onTap;

  const AppBottomBar({super.key, required this.activeTab, this.onTap});

  Color _iconColor(BottomTab tab) {
    return tab == activeTab ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFB8A6FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.home, color: _iconColor(BottomTab.home)),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.file_copy, color: _iconColor(BottomTab.receipts)),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/favorites');
            },
            icon: Icon(Icons.star, color: _iconColor(BottomTab.favorites)),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/help');
            },
            icon: Icon(Icons.support_agent, color: _iconColor(BottomTab.help)),
          ),
        ],
      ),
    );
  }
}
