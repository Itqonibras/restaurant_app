import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';
import 'package:restaurant_app/widget/no_internet_widget.dart';

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
            padding: const EdgeInsets.all(12.0),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 2,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.search_rounded),
                ),
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
              } else {
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
    final screenSize = MediaQuery.of(context).size.width;
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
            SizedBox(
              height: (3 * (screenSize - 36)) / 4,
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
                        return YouMayLikeCard(
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
          ],
        ),
      ),
    );
  }
}

class YouMayLikeCard extends StatelessWidget {
  final Restaurant restaurant;

  const YouMayLikeCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: screenSize - 36,
              height: (3 * (screenSize - 36)) / 4,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: screenSize - 36,
                  height: (9 * (screenSize - 36)) / 16,
                  child: Image.network(
                    ApiService().mediumImage(restaurant.pictureId!),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(
                width: screenSize - 36,
                height: (3 * (screenSize - 36)) / 16,
                child: ListTile(
                  title: Text(restaurant.name!),
                  subtitle: Text(restaurant.city!),
                  trailing: Icon(Icons.star_rate_rounded),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
