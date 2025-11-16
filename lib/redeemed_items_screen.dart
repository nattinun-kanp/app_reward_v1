import 'package:flutter/material.dart';

class RedeemedItem {
  final String name;
  final int points;
  final String redeemedDate;
  final String imageUrl;

  RedeemedItem({
    required this.name,
    required this.points,
    required this.redeemedDate,
    required this.imageUrl,
  });
}

class RedeemedItemsScreen extends StatelessWidget {
  final List<RedeemedItem> items;

  const RedeemedItemsScreen({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redeemed Items'),
      ),
      body: items.isEmpty
          ? const Center(child: Text('No redeemed items yet.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        item.imageUrl,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.card_giftcard, size: 56),
                      ),
                    ),
                    title: Text(item.name),
                    subtitle: Text('Redeemed on ${item.redeemedDate}'),
                    trailing: Text('${item.points} Points', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                );
              },
            ),
    );
  }
}