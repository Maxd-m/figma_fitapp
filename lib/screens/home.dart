import 'package:flutter/material.dart';
import 'package:figma_fitapp/widgets/app_bottom_bar.dart';
import 'package:figma_fitapp/widgets/recomendation_card.dart';
import 'package:figma_fitapp/widgets/article_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      bottomNavigationBar: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: const Color(0xFF1C1C1E), // Mismo color de fondo
        child: AppBottomBar(activeTab: BottomTab.home),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                _buildTopBar(context),
                const SizedBox(height: 18),
                _buildMenuRow(),
                const SizedBox(height: 18),
                const Text(
                  'Recommendations',
                  style: TextStyle(
                    color: Colors.limeAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                _buildRecommendationsList(),
                const SizedBox(height: 16),
                _buildWeeklyChallenge(),
                const SizedBox(height: 18),
                const Text(
                  'Articles & Tips',
                  style: TextStyle(
                    color: Colors.limeAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                _buildArticlesRow(),
                // const Spacer(),
                // AppBottomBar(activeTab: BottomTab.home),
                // _buildBottomNavBar(context),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hi, Madison',
              style: TextStyle(
                color: Color(0xFFB8A6FF), // purple-ish
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "It's time to challenge your limits.",
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none, color: Colors.white),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: const Icon(Icons.person_outline, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuRow() {
    // Función auxiliar para los separadores verticales
    Widget _buildSeparator() {
      return Container(
        height: 40, // Altura de la línea divisoria
        width: 1,
        color: Colors.white24, // Color suave para la línea
      );
    }

    Widget menuItem(IconData icon, String label, Color color) {
      return Expanded(
        // Usamos Expanded para que ocupen el mismo espacio
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 32), // Iconos un poco más grandes
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          menuItem(
            Icons.fitness_center,
            'Workout',
            const Color(0xFFD4FF5E),
          ), // Verde Lima
          _buildSeparator(),
          menuItem(
            Icons.assignment_outlined,
            'Progress\nTracking',
            const Color(0xFFB8A6FF),
          ), // Lavanda
          _buildSeparator(),
          menuItem(Icons.apple_outlined, 'Nutrition', const Color(0xFFB8A6FF)),
          _buildSeparator(),
          menuItem(Icons.groups_outlined, 'Community', const Color(0xFFB8A6FF)),
        ],
      ),
    );
  }

  Widget _buildRecommendationsList() {
    final items = [
      {
        'title': 'Squat Exercise',
        'time': '12 Minutes',
        'kcal': '120 Kcal',
        'image': 'assets/image.png', // Tu ruta de imagen
        'isFavorite': true,
      },
      {
        'title': 'Full Body Stretch',
        'time': '15 Minutes',
        'kcal': '80 Kcal',
        'image': 'assets/strech.jpg',
        'isFavorite': false,
      },
    ];

    return SizedBox(
      height: 260, // Aumentamos el alto para acomodar el nuevo diseño
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final item = items[index];
          return RecommendationCard(
            title: item['title'] as String,
            time: item['time'] as String,
            kcal: item['kcal'] as String,
            imagePath: item['image'] as String,
            isFavorite: item['isFavorite'] as bool,
          );
        },
      ),
    );
  }

  Widget _buildWeeklyChallenge() {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: BoxDecoration(
        color: const Color(0xFFB8A6FF).withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Weekly Challenge',
                    style: TextStyle(
                      color: Colors.limeAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Plank With Hip Twist',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            child: Image.asset(
              'assets/plank.jpg',
              width: 120,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          // Container(
          //   width: 120,
          //   height: 110,
          //   margin: const EdgeInsets.only(right: 0),
          //   // TODO: Replace this colored box with the challenge image (Image.asset or NetworkImage)
          //   color: const Color(0xFF2E2B3B),
          //   child: const Center(
          //     child: Icon(Icons.image, color: Colors.white30, size: 36),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildArticlesRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment
          .start, // Alinea al inicio si los textos tienen diferente longitud
      children: const [
        Expanded(
          child: ArticleCard(
            title: 'Supplement Guide...',
            imagePath: 'assets/suplements.jpg',
            isFavorite: true, // La de la imagen tiene estrella amarilla
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: ArticleCard(
            title: '15 Quick & Effective Daily Routines...',
            imagePath: 'assets/routines.jpg',
            isFavorite: false, // La de la imagen tiene estrella blanca
          ),
        ),
      ],
    );
  }
}
