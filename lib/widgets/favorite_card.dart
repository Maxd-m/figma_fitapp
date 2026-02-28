import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  final String title;
  final String? time;
  final String? kcal;
  final String? exercises;
  final String? description;
  final String imagePath;
  final bool isVideo;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.isVideo,
    this.time,
    this.kcal,
    this.exercises,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, // Altura fija para mantener consistencia
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          // Lado izquierdo: Textos
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF1C1C1E),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 6),

                // Si tiene descripción (Artículos)
                if (description != null)
                  Text(
                    description!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  )
                // Si tiene estadísticas (Videos/Workouts)
                else
                  _buildStatsRow(),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // Lado derecho: Imagen con Stack
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  width: 120,
                  height: 96,
                  fit: BoxFit.cover,
                ),
              ),
              // Botón de Play (solo si es video)
              if (isVideo)
                const Positioned.fill(
                  child: Center(
                    child: Icon(
                      Icons.play_circle_filled,
                      color: Color(0xFFB8A6FF),
                      size: 30,
                    ),
                  ),
                ),
              // Estrella amarilla fija arriba a la derecha
              const Positioned(
                top: 6,
                right: 6,
                child: Icon(Icons.star, color: Color(0xFFD4FF5E), size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (time != null) _statItem(Icons.access_time, time!),
            const SizedBox(width: 10),
            if (kcal != null) _statItem(Icons.local_fire_department, kcal!),
          ],
        ),
        if (exercises != null) ...[
          const SizedBox(height: 4),
          _statItem(Icons.fitness_center, exercises!),
        ],
      ],
    );
  }

  Widget _statItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.black87),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
