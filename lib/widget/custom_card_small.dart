import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant_model.dart';
import '../data/api/api_service.dart';
import '../page/detail_page.dart';

class CustomCardSmall extends StatelessWidget {
  final Restaurant restaurant;

  const CustomCardSmall({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailPage.routeName,
            arguments: restaurant,
          );
        },
        child: Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 80,
              width: screenWidth,
              color: const Color(0xFFFFFFFF),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.network(
                        ApiService().smallImage(restaurant.pictureId),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                restaurant.name!,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                restaurant.city!,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(restaurant.rating.toString()),
                              const Icon(
                                Icons.star_rate_rounded,
                                color: Colors.orangeAccent,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
