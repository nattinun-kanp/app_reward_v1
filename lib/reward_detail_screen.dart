import 'package:flutter/material.dart';

class RewardDetailScreen extends StatelessWidget {
  final String name;
  final int points;
  final int stock;
  final String imageUrl;

  const RewardDetailScreen({
    super.key,
    required this.name,
    required this.points,
    required this.stock,
    required this.imageUrl,
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
              onPressed: () {
                // TODO: นำไปสู่ flow การแลกแต้มจริงในอนาคต
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('ยังไม่เปิดใช้งานการแลกแต้ม')),
                );
              },
              icon: const Icon(Icons.card_giftcard),
              label: const Text('Redeem'),
            ),
          ),
        ),
      ),
    );
  }
}