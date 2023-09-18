import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/widget/fav_button.dart';
import '../data/api/api_service.dart';
import '../data/model/restaurant_model.dart';

class DetailHeader extends StatelessWidget {
  final Restaurant restaurant;

  const DetailHeader({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Material(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        restaurant.name!,
                        style: GoogleFonts.hind(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.10,
                        ),
                      ),
                      FavButton(restaurant: restaurant),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
