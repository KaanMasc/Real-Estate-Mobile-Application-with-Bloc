import 'package:flutter/material.dart';
class AdtoFavoritesButton extends StatefulWidget {
  const AdtoFavoritesButton({super.key});

  @override
  State<AdtoFavoritesButton> createState() => _AdtoFavoritesButtonState();
}

class _AdtoFavoritesButtonState extends State<AdtoFavoritesButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 206, 203, 203),
            Colors.grey,
          ],
        ),
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });

          if (isFavorite) {
            // Remove from favorites list.
          } else {
            // Add to faborite List,
          }
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
          color: isFavorite ? Colors.red : null,
        ),
      ),
    );
  }
}
