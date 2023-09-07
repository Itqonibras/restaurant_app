import 'package:flutter/material.dart';
import '../data/api/api_service.dart';
import '../data/model/restaurant_model.dart';

class CustomCardBig extends StatelessWidget {
  final dynamic restaurant;

  const CustomCardBig({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: screenWidth - 36,
                height: (3 * (screenWidth - 36)) / 4,
                color: const Color(0xFFFFFFFF),
              ),
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    width: screenWidth - 36,
                    height: (9 * (screenWidth - 36)) / 16,
                    child: Image.network(
                      ApiService().mediumImage(restaurant.pictureId!),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth - 36,
                  height: (3 * (screenWidth - 36)) / 16,
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
                            const Icon(Icons.star_rate_rounded),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}