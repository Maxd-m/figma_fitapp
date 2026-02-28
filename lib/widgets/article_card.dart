import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isFavorite;

  const ArticleCard({
    super.key,
    required this.title,
    required this.imagePath,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {}, // TODO: Abrir artículo
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Parte superior: Imagen con estrella
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  height: 140, // Ajusta según prefieras
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Icono de estrella
              Positioned(
                top: 10,
                right: 10,
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  color: isFavorite ? const Color(0xFFD4FF5E) : Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Parte inferior: Título
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
