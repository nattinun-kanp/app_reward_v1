import 'package:flutter/material.dart';

class RewardItemCard extends StatelessWidget {
  const RewardItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network('https://via.placeholder.com/150', fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Product Name', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('1,000 Points', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Stock: 10', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}