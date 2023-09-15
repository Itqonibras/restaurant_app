import 'package:flutter/material.dart';

class FavPage extends StatelessWidget {
  static const routeName = 'fav-page';

  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Restaurant'),
      ),
    );
  }
}
