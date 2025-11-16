import 'package:app_reward_v1/redeemed_items_screen.dart';
import 'package:flutter/material.dart';

class RewardDetailScreen extends StatelessWidget {
  final String name;
  final int points;
  final int stock;
  final String imageUrl;
  final int currentUserPoints;
  final Function(RedeemedItem) onRedeem;

  const RewardDetailScreen({
    super.key,
    required this.name,
    required this.points,
    required this.stock,
    required this.imageUrl,
    required this.currentUserPoints,
    required this.onRedeem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reward Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      height: 200,
                      child: Center(child: Icon(Icons.image_not_supported)),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('$points Points', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text('Stock: $stock', style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              const Text(
                'Reward Description',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'รายละเอียดของรางวัล: รายการนี้เป็นตัวอย่างสำหรับการพรีวิว คุณสามารถปรับแต่งคำอธิบายให้สอดคล้องกับข้อมูลจริง เช่น วัสดุ ขนาด เงื่อนไขการแลก และวันที่หมดอายุ.',
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'ใช้ $points Points เพื่อแลกรางวัลนี้',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _showRedeemDialog(context),
              icon: const Icon(Icons.card_giftcard),
              label: Text('Redeem ($points Points)'),
            ),
          ),
        ),
      ),
    );
  }

  void _showRedeemDialog(BuildContext context) {
    final userPoints = currentUserPoints;
    if (userPoints < points) {
      showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Insufficient Points'),
          content: Text('You need $points Points but have only $userPoints.'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }
    showDialog<void>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Confirm Redeem'),
          content: Text('Use $points Points to redeem "$name"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                onRedeem(RedeemedItem(
                  name: name,
                  points: points,
                  redeemedDate: '16-11-2025',
                  imageUrl: imageUrl,
                ));
                _showSuccessDialog(context);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text('Success!'),
          content: Text('You have successfully redeemed "$name" for $points Points.'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }
}