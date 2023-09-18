import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';
import 'package:restaurant_app/widget/expandable_description.dart';
import '../data/api/api_service.dart';
import '../provider/restaurant_provider.dart';
import '../widget/detail_header.dart';
import '../widget/menu_widget.dart';
import '../widget/restaurant_info_widget.dart';

class DetailPage extends StatelessWidget {
  static const routeName = 'detail-page';

  final String id;

  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RestaurantDetailProvider(apiService: ApiService(), id: id),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Restaurant Detail'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left),
          ),
        ),
        body: const DetailPageConsumer(),
      ),
    );
  }
}

class DetailPageConsumer extends StatelessWidget {
  const DetailPageConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantDetailProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.state == ResultState.hasData) {
          return DetailPageBody(restaurant: state.result.restaurant!);
        } else if (state.state == ResultState.noData) {
          return Center(
            child: Text(state.message),
          );
        } else if (state.state == ResultState.error) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Text("");
        }
      },
    );
  }
}

class DetailPageBody extends StatelessWidget {
  final RestaurantDetail restaurant;

  const DetailPageBody({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: DetailHeader(restaurantDetail: restaurant),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: RestaurantInfo(restaurantDetail: restaurant),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: Text(
              'Restaurant description',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: ExpandableDescription(text: restaurant.description!),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: Text(
              'Foods',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 6),
            child: MenuWidget(
              restaurantDetail: restaurant,
              menuType: 'Foods',
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: Text(
              'Drinks',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 6),
            child: MenuWidget(
              restaurantDetail: restaurant,
              menuType: 'Drinks',
            ),
          ),
        ],
      ),
    );
  }
}