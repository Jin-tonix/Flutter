import 'package:flutter/material.dart';

import '../InteractionWidget.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CoffeeCardData> wishList = ModalRoute.of(context)!.settings.arguments as List<CoffeeCardData>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish List'),
      ),
      body: ListView.builder(
        itemCount: wishList.length,
        itemBuilder: (context, index) {
          final coffeeCard = wishList[index];
          return ListTile(
            leading: Image.network(
              coffeeCard.url,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(coffeeCard.name),
            subtitle: Text(coffeeCard.description),
          );
        },
      ),
    );
  }
}
