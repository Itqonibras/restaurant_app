import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:restaurant_app/data/model/restaurant_model.dart';
import 'package:restaurant_app/data/model/restaurant_search_model.dart';

import '../model/restaurant_detail_model.dart';

class ApiService{
  static const _baseUrl = 'https://restaurant-api.dicoding.dev';
  static const _list = '/list';
  static const _search = '/search?q=';
  static const _detail = '/detail/';
  static const _smallImageUrl = '/images/small/';
  static const _mediumImageUrl = '/images/medium/';
  static const _largeImageUrl = '/images/large/';


  Future<RestaurantResult> restaurant() async {
    final response = await http.get(Uri.parse('$_baseUrl$_list'));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<RestaurantSearchResult> restaurantSearch(query) async {
    final response = await http.get(Uri.parse('$_baseUrl$_search$query'));
    if (response.statusCode == 200) {
      return RestaurantSearchResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<RestaurantDetailResult> restaurantDetail(id) async {
    final response = await http.get(Uri.parse("$_baseUrl$_detail$id"));
    if (response.statusCode == 200) {
      return RestaurantDetailResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }

  smallImage(pictureId) {
    String url = '$_baseUrl$_smallImageUrl$pictureId';
    return url;
  }

  mediumImage(pictureId) {
    String url = '$_baseUrl$_mediumImageUrl$pictureId';
    return url;
  }

  largeImage(pictureId) {
    String url = '$_baseUrl$_largeImageUrl$pictureId';
    return url;
  }
}