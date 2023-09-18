import 'package:flutter/material.dart';
import '../data/model/restaurant_detail_model.dart';

class RestaurantInfo extends StatelessWidget {
  final RestaurantDetail restaurantDetail;

  const RestaurantInfo({super.key, required this.restaurantDetail});

  @override
  Widget build(BuildContext context) {
    return Material(
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
                      restaurantDetail.city!,
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
                      restaurantDetail.rating.toString(),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
