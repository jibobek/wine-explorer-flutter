import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReviewItemWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String text;
  final double rating;
  final String date;

  const ReviewItemWidget({
    required this.imageUrl,
    required this.name,
    required this.text,
    required this.rating,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(date);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https:$imageUrl'),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 20),
                  const SizedBox(width: 5),
                  Text(
                    rating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    DateFormat('dd.MM.yyyy HH:mm').format(dateTime),
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
