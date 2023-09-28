import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/database_provider.dart';
import 'package:restaurant_app/utils/result_state.dart';

import '../widget/custom_card_small.dart';

class FavPage extends StatelessWidget {
  static const routeName = 'fav-page';

  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Restaurant'),
      ),
      body: const FavPageConsumer(),
    );
  }
}

class FavPageConsumer extends StatelessWidget {
  const FavPageConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.noData) {
          return const Center(
            child: Text(
              'Your favorite restaurant\nwill appear here',
              textAlign: TextAlign.center,
            ),
          );
        } else if (state.state == ResultState.hasData) {
          return FavPageBody(state: state);
        } else if (state.state == ResultState.error) {
          return Text(state.message);
        } else {
          return const Text('');
        }
      },
    );
  }
}

class FavPageBody extends StatelessWidget {
  final DatabaseProvider state;

  const FavPageBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.favorite.length,
        itemBuilder: (context, index) {
          var restaurant = state.favorite[index];
          return CustomCardSmall(restaurant: restaurant);
        },
      ),
    );
  }
}
