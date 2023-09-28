import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'package:restaurant_app/data/model/restaurant_search_model.dart';
import '../model/restaurant_detail_model.dart';

class ApiService{
  Client? client;
  ApiService({this.client}) {
    client ??= Client();
  }

  static const baseUrl = 'https://restaurant-api.dicoding.dev';
  static const list = '/list';
  static const search = '/search?q=';
  static const detail = '/detail/';
  static const _smallImageUrl = '/images/small/';
  static const _mediumImageUrl = '/images/medium/';
  static const _largeImageUrl = '/images/large/';


  Future<RestaurantResult> restaurant() async {
    final response = await client!.get(Uri.parse('$baseUrl$list'));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<RestaurantSearchResult> restaurantSearch(query) async {
    final response = await client!.get(Uri.parse('$baseUrl$search$query'));
    if (response.statusCode == 200) {
      return RestaurantSearchResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<RestaurantDetailResult> restaurantDetail(id) async {
    final response = await client!.get(Uri.parse("$baseUrl$detail$id"));
    if (response.statusCode == 200) {
      return RestaurantDetailResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }

  smallImage(pictureId) {
    String url = '$baseUrl$_smallImageUrl$pictureId';
    return url;
  }

  mediumImage(pictureId) {
    String url = '$baseUrl$_mediumImageUrl$pictureId';
    return url;
  }

  largeImage(pictureId) {
    String url = '$baseUrl$_largeImageUrl$pictureId';
    return url;
  }
}