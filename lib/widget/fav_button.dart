import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import '../data/model/restaurant_model.dart';

class FavButton extends StatelessWidget {
  final Restaurant restaurant;

  const FavButton({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, _) {
        return FutureBuilder(
          future: provider.isFavorite(restaurant.id!),
          builder: (context, snapshot) {
            var isFavorite = snapshot.data ?? false;
            if (isFavorite) {
              return SizedBox(
                child: IconButton(
                  onPressed: () {
                    provider.removeFavorite(restaurant.id!);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        content: const Text('Removed from favorite'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            provider.addFavorite(restaurant);
                          },
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.favorite_rounded,
                    color: Colors.pinkAccent,
                  ),
                ),
              );
            } else {
              return SizedBox(
                child: IconButton(
                  onPressed: () {
                    provider.addFavorite(restaurant);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        content: const Text('Added to favorite'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            provider.removeFavorite(restaurant.id!);
                          },
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.favorite_outline_rounded,
                    color: Colors.white,
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
