import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreItemWidget extends StatelessWidget {
  final String imageUrl;
  final int? year;
  final String title;
  final String description;
  final double rating;
  final double price;
  final String? pricePrefix;
  final String? priceSuffix;
  final VoidCallback onTap;
  const ExploreItemWidget(
      {super.key,
      required this.imageUrl,
      required this.year,
      required this.title,
      required this.description,
      required this.rating,
      required this.price,
      required this.pricePrefix,
      required this.priceSuffix,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Image.network(
        'https:$imageUrl',
        width: 64,
        height: 64,
      ),
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(description),
          Visibility(visible: year != null, child: Text('Rok: $year')),
          Text(
              'Cena: ${priceSuffix ?? ""} ${price.toStringAsFixed(2)} ${pricePrefix ?? ""}'),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(rating.toStringAsFixed(1)),
          Row(
            children: [
              for (var i = 0; i < 5; i++)
                Icon(
                  i < rating.floor() ? Icons.star : Icons.star_border,
                  size: 16,
                  color: Colors.yellow,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
