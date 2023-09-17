import 'package:restaurant_app/data/model/restaurant_model.dart';

class RestaurantSearchResult {
  bool? error;
  num? founded;
  List<Restaurant>? restaurants;

  RestaurantSearchResult({this.error, this.founded, this.restaurants});

  RestaurantSearchResult.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    founded = json['founded'];
    if (json['restaurants'] != null) {
      restaurants = <Restaurant>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(Restaurant.fromJson(v));
      });
    }
  }
}
