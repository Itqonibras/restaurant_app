import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/widget/no_data_widget.dart';
import 'package:restaurant_app/widget/no_internet_widget.dart';
import '../widget/custom_card_small.dart';
import '../widget/custom_card_big.dart';

String text = '';

class HomePage extends StatelessWidget {
  static const routeName = 'home-page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 2,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.search_rounded),
                ),
                onSubmitted: (value) {
                  text = value;
                  Provider.of<RestaurantProvider>(context, listen: false)
                      .setQuery(value);
                },
              ),
            ),
          ),
          Consumer<RestaurantProvider>(
            builder: (context, state, _) {
              if (state.state == ResultState.loading) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state.state == ResultState.error) {
                return const Expanded(child: Center(child: NoInternetWidget()));
              } else if (state.state == ResultState.hasData) {
                return HomeScreenBody(state: state);
              } else if (state.state == ResultState.noData) {
                return const Expanded(child: Center(child: NoDataWidget()));
              }else {
                return const Text('');
              }
            },
          ),
        ],
      ),
    );
  }
}

List<T> pickRandomItemsAsList<T>(List<T> items, int count) =>
    (items.toList()..shuffle()).take(count).toList();

class HomeScreenBody extends StatelessWidget {
  final RestaurantProvider state;

  const HomeScreenBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (text == '') {
      return MainBody(state: state);
    } else {
      return SearchBody(state: state);
    }
  }
}

class MainBody extends StatelessWidget {
  final RestaurantProvider state;

  const MainBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final youMayLike = pickRandomItemsAsList(state.result.restaurants!, 3);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              child: Text('You may like',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 6),
              child: SizedBox(
                height: (3 * (screenWidth - 36)) / 4,
                child: SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        itemCount: youMayLike.length,
                        itemBuilder: (context, index) {
                          var restaurant = youMayLike[index];
                          return CustomCardBig(
                            restaurant: restaurant,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(width: 12);
                        },
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              child: Text('All restaurant',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.result.restaurants!.length,
              itemBuilder: (context, index) {
                var restaurant = state.result.restaurants![index];
                return CustomCardSmall(restaurant: restaurant);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBody extends StatelessWidget {
  final RestaurantProvider state;

  const SearchBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              child: Text('Search result',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.result.restaurants!.length,
              itemBuilder: (context, index) {
                var restaurant = state.result.restaurants![index];
                return CustomCardSmall(restaurant: restaurant);
              },
            ),
          ],
        ),
      ),
    );
  }
}