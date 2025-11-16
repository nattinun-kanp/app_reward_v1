import 'package:flutter/material.dart';

class RewardItemCard extends StatelessWidget {
  final String name;
  final int points;
  final int stock;
  final String imageUrl;

  const RewardItemCard({
    super.key,
    required this.name,
    required this.points,
    required this.stock,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 120,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return SizedBox(
                height: 120,
                child: Center(
                  child: Icon(Icons.image_not_supported),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('${points} Points', style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Stock: $stock', style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}