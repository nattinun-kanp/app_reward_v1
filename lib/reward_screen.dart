import 'package:app_reward_v1/reward_item_card.dart';
import 'package:app_reward_v1/reward_detail_screen.dart';
import 'package:flutter/material.dart';
 
class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardItem {
  final String name;
  final int points;
  final int stock;
  final String imageUrl;

  const _RewardItem({
    required this.name,
    required this.points,
    required this.stock,
    required this.imageUrl,
  });
}

class _RewardScreenState extends State<RewardScreen> {
  final List<_RewardItem> _items = [
    const _RewardItem(name: 'Alpha Mug', points: 850, stock: 12, imageUrl: 'https://via.placeholder.com/150'),
    const _RewardItem(name: 'Beta T-Shirt', points: 1200, stock: 8, imageUrl: 'https://via.placeholder.com/150'),
    const _RewardItem(name: 'Gamma Cap', points: 450, stock: 20, imageUrl: 'https://via.placeholder.com/150'),
    const _RewardItem(name: 'Delta Bag', points: 1500, stock: 5, imageUrl: 'https://via.placeholder.com/150'),
    const _RewardItem(name: 'Epsilon Pen', points: 300, stock: 50, imageUrl: 'https://via.placeholder.com/150'),
    const _RewardItem(name: 'Zeta Notebook', points: 700, stock: 25, imageUrl: 'https://via.placeholder.com/150'),
    const _RewardItem(name: 'Eta Bottle', points: 950, stock: 10, imageUrl: 'https://via.placeholder.com/150'),
    const _RewardItem(name: 'Theta Hoodie', points: 2000, stock: 3, imageUrl: 'https://via.placeholder.com/150'),
    const _RewardItem(name: 'Iota Sticker', points: 150, stock: 100, imageUrl: 'https://via.placeholder.com/150'),
    const _RewardItem(name: 'Kappa Keychain', points: 500, stock: 40, imageUrl: 'https://via.placeholder.com/150'),
  ];

  void _sortByLowestPoints() {
    setState(() {
      _items.sort((a, b) => a.points.compareTo(b.points));
    });
  }

  void _sortByHighestPoints() {
    setState(() {
      _items.sort((a, b) => b.points.compareTo(a.points));
    });
  }

  void _sortByNameAZ() {
    setState(() {
      _items.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    });
  }

  void _openSortSheet() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.trending_down),
                title: const Text('Sort by Lowest Points'),
                onTap: () {
                  Navigator.pop(ctx);
                  _sortByLowestPoints();
                },
              ),
              ListTile(
                leading: const Icon(Icons.trending_up),
                title: const Text('Sort by Highest Points'),
                onTap: () {
                  Navigator.pop(ctx);
                  _sortByHighestPoints();
                },
              ),
              ListTile(
                leading: const Icon(Icons.sort_by_alpha),
                title: const Text('Sort A–Z'),
                onTap: () {
                  Navigator.pop(ctx);
                  _sortByNameAZ();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: Image.network(
              'https://via.placeholder.com/150',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.person);
              },
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Reward', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('9,869 Points', style: TextStyle(fontSize: 14)),
            Text('Expires on: 31-12-68', style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FilterChip(label: const Text('Reward Items'), onSelected: (bool value) {}),
                    const SizedBox(width: 10),
                    FilterChip(label: const Text('Redeemed Items'), onSelected: (bool value) {}),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: _openSortSheet,
                  tooltip: 'Sort',
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => RewardDetailScreen(
                            name: item.name,
                            points: item.points,
                            stock: item.stock,
                            imageUrl: item.imageUrl,
                          ),
                        ),
                      );
                    },
                    child: RewardItemCard(
                      name: item.name,
                      points: item.points,
                      stock: item.stock,
                      imageUrl: item.imageUrl,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'To do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Reward',
          ),
        ],
      ),
    );
  }
}