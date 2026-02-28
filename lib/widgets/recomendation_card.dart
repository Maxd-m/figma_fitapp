import 'package:flutter/material.dart';

class RecommendationCard extends StatelessWidget {
  final String title;
  final String time;
  final String kcal;
  final String imagePath; // Nuevo parámetro
  final bool isFavorite; // Nuevo parámetro

  const RecommendationCard({
    super.key,
    required this.title,
    required this.time,
    required this.kcal,
    required this.imagePath,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E), // Fondo oscuro
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ), // Borde blanco de la imagen
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sección Superior: Imagen + Iconos
          Stack(
            clipBehavior: Clip
                .none, // Permite que el botón de play sobresalga si es necesario
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
                child: Image.asset(
                  imagePath,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Estrella de favorito
              Positioned(
                top: 12,
                right: 12,
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  color: const Color(0xFFD4FF5E), // Color lima/amarillo
                  size: 28,
                ),
              ),
              // Botón de Play Circular
              Positioned(
                bottom: -20,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Color(0xFF9181F4), // Morado del botón
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),

          // Sección Inferior: Textos
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFFD4FF5E), // Color Lima
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_filled,
                      size: 18,
                      color: Color(0xFF9181F4),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      time,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.local_fire_department,
                      size: 18,
                      color: Color(0xFF9181F4),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      kcal,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
