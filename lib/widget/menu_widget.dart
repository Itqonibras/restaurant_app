import 'package:flutter/material.dart';
import '../data/model/restaurant_detail_model.dart';
import 'custom_card_medium.dart';

class MenuWidget extends StatelessWidget {
  final RestaurantDetail restaurantDetail;

  final String menuType;

  const MenuWidget(
      {super.key, required this.restaurantDetail, required this.menuType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              itemCount: menuType == 'Drinks'
                  ? restaurantDetail.menus!.drinks!.length
                  : restaurantDetail.menus!.foods!.length,
              itemBuilder: (context, index) {
                return CustomCardMedium(
                    text: menuType == 'Drinks'
                        ? restaurantDetail.menus!.drinks![index].name
                        : restaurantDetail.menus!.foods![index].name);
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
    );
  }
}