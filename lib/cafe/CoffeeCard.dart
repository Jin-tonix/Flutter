import 'package:flutter/material.dart';
import 'package:practice/cafe/wishlist/Wishbtn.dart';

class CoffeeCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final VoidCallback? onTap; // 추가된 부분

  const CoffeeCard({
    required this.imageUrl,
    required this.name,
    required this.description,
    this.onTap, // 추가된 부분
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: WishBtn(
                onPressed: onTap, // 추가된 부분
              ),
            ),
          ),
        ],
      ),
    );
  }
}
