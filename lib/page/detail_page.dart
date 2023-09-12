import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';
import 'package:restaurant_app/widget/custom_card_medium.dart';
import 'package:restaurant_app/widget/expandable_description.dart';
import '../data/api/api_service.dart';
import '../provider/restaurant_provider.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: screenWidth - 12,
                      height: (screenWidth - 12) / 2,
                      child: Image.network(
                        ApiService().largeImage(restaurant.pictureId),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    child: Container(
                      width: screenWidth,
                      height: (3 * (screenWidth)) / 16,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: <Color>[
                            Colors.black,
                            Colors.transparent
                          ])),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            restaurant.name!,
                            style: GoogleFonts.hind(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: const Color(0xFFFFFFFF),
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.location_on_rounded),
                            Text(
                              restaurant.city!,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        color: const Color(0xFFCECECE),
                        width: 2,
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star_rate_rounded),
                            Text(
                              restaurant.rating.toString(),
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: Text('Restaurant Description',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: const Color(0xFFFFFFFF),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpandableDescription(
                      text: restaurant.description!,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: Text('Foods',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 6),
            child: SizedBox(
              height: 200,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: restaurant.menus!.foods!.length,
                      itemBuilder: (context, index) {
                        return CustomCardMedium(
                            text: restaurant.menus!.foods![index].name);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 8,
                        );
                      },
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: Text('Drinks',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 6),
            child: SizedBox(
              height: 200,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: restaurant.menus!.drinks!.length,
                      itemBuilder: (context, index) {
                        return CustomCardMedium(
                            text: restaurant.menus!.drinks![index].name);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 8,
                        );
                      },
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
