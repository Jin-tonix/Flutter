import 'package:flutter/material.dart';
import 'CoffeeCardCreateWidget.dart';
import 'CoffeeCard.dart';


class InteractionWidget extends StatefulWidget {
  const InteractionWidget({super.key});

  @override
  _InteractionWidgetState createState() => _InteractionWidgetState();
}

class _InteractionWidgetState extends State<InteractionWidget> {
  final List<CoffeeCardData> _coffeeCards = [];
  final List<CoffeeCardData> _wishList = [];

  void _addCoffeeCard(String url, String name, String description) {
    setState(() {
      _coffeeCards.add(CoffeeCardData(url, name, description));
    });
  }

  void _addToWishList(CoffeeCardData coffeeCard) {
    setState(() {
      if (!_wishList.contains(coffeeCard)) {
        _wishList.add(coffeeCard);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _coffeeCards.length,
            itemBuilder: (context, index) {
              final coffeeCard = _coffeeCards[index];
              return CoffeeCard(
                imageUrl: coffeeCard.url,
                name: coffeeCard.name,
                description: coffeeCard.description,
                onTap: () {
                  _addToWishList(coffeeCard);
                },
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        FormWidget(
          onSubmit: _addCoffeeCard,
        ),
      ],
    );
  }
}

class CoffeeCardData {
  final String url;
  final String name;
  final String description;

  CoffeeCardData(this.url, this.name, this.description);
}
