import 'package:flutter/material.dart';
import 'package:figma_fitapp/widgets/app_bottom_bar.dart';
import 'package:figma_fitapp/widgets/favorite_card.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildHeader(context),
              const SizedBox(height: 20),
              _buildFilters(),
              const SizedBox(height: 20),
              Expanded(child: _buildFavoritesList()),
              // El BottomBar lo dejamos fuera del padding si prefieres que ocupe todo el ancho
              AppBottomBar(activeTab: BottomTab.favorites),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  // Mantenemos tu _buildHeader como pediste
  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Favorites',
          style: TextStyle(
            color: Color(0xFFB8A6FF),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: const [
            Icon(Icons.search, color: Colors.white, size: 28),
            // SizedBox(width: 16),
            // Icon(Icons.notifications_none, color: Color(0xFFB8A6FF), size: 28),
            // SizedBox(width: 16),
            // Icon(Icons.person_outline, color: Color(0xFFB8A6FF), size: 28),
          ],
        ),
      ],
    );
  }

  Widget _buildFilters() {
    Widget chip(String label, {bool active = false}) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: active
              ? const Color(0xFFD4FF5E)
              : Colors.white, // Amarillo/Verde vs Blanco
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors
                .black, // Texto siempre negro en los filtros según la imagen
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      );
    }

    return Row(
      children: [
        const Text(
          'Sort By',
          style: TextStyle(
            color: Color(0xFFD4FF5E),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 12),
        chip('All', active: true),
        const SizedBox(width: 8),
        chip('Video'),
        const SizedBox(width: 8),
        chip('Article'),
      ],
    );
  }

  Widget _buildFavoritesList() {
    // Datos extendidos para que coincidan con la imagen
    final items = [
      {
        'title': 'Upper Body',
        'time': '60 Minutes',
        'kcal': '1320 Kcal',
        'exercises': '5 Exercises',
        'image': 'assets/strech.jpg',
        'isVideo': true,
      },
      {
        'title': 'Boost Energy And Vitality',
        'description':
            'Incorporating physical exercise into your daily routine can boost...',
        'image': 'assets/strech.jpg',
        'isVideo': false,
      },
      {
        'title': 'Pull Out',
        'time': '30 Minutes',
        'kcal': '1210 Kcal',
        'exercises': '10 Exercises',
        'image': 'assets/strech.jpg',
        'isVideo': true,
      },
      {
        'title': 'Lower Body Blast',
        'description':
            'A lower body blast is a high-intensity workout focused on targeting...',
        'image': 'assets/strech.jpg',
        'isVideo': false,
      },
      {
        'title': 'Avocado And Egg Toast',
        'time': '15 Minutes',
        'kcal': '150 Cal',
        'image': 'assets/strech.jpg',
        'isVideo': false,
      },
    ];

    return ListView.separated(
      itemCount: items.length,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final item = items[index];
        return FavoriteCard(
          title: item['title'] as String,
          time: item['time'] as String?,
          kcal: item['kcal'] as String?,
          exercises: item['exercises'] as String?,
          description: item['description'] as String?,
          imagePath: item['image'] as String,
          isVideo: item['isVideo'] as bool,
        );
      },
    );
  }
}
