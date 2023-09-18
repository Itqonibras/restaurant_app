import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/api/api_service.dart';
import '../data/model/restaurant_detail_model.dart';

class DetailHeader extends StatelessWidget {
  final RestaurantDetail restaurantDetail;

  const DetailHeader({super.key, required this.restaurantDetail});

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
                ApiService().largeImage(restaurantDetail.pictureId),
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
                    restaurantDetail.name!,
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
    );
  }
}
