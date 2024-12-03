import 'package:flutter/material.dart';
import 'package:foodsocialapp/components/circle_image.dart';
import 'package:foodsocialapp/food_themes.dart';

class AuthorCard extends StatefulWidget {
  const AuthorCard(
      {super.key,
      required this.authorName,
      required this.title,
      this.imageProvider});

  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImageWidget(
                imageProvider: widget.imageProvider,
                radius: 28,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                children: [
                  Text(
                    widget.authorName,
                    style: FoodTheme.lightTextTheme.bodyLarge,
                  ),
                  Text(
                    widget.title,
                    style: FoodTheme.lightTextTheme.bodyLarge,
                  )
                ],
              )
            ],
          ),
          IconButton(
              iconSize: 30,
              color: Colors.red,
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Favorite pressed")));
              },
              icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border))
        ],
      ),
    );
  }
}
