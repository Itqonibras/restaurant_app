import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/result_state.dart';

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  String query;

  RestaurantProvider({required this.apiService, this.query = ''}) {
    _fetchRestaurant(query);
  }

  late dynamic _restaurantResult;

  dynamic get result => _restaurantResult;

  String _message = '';

  String get message => _message;

  late ResultState _state;

  ResultState get state => _state;

  Future<void> _fetchRestaurant(query) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      if (query == '') {
        final restaurant = await apiService.restaurant();
        if (restaurant.restaurants!.isEmpty) {
          _state = ResultState.noData;
          notifyListeners();
          _message = 'Empty data';
        } else {
          _state = ResultState.hasData;
          notifyListeners();
          _restaurantResult = restaurant;
        }
      } else {
        final restaurant = await apiService.restaurantSearch(query);
        if (restaurant.restaurants!.isEmpty) {
          _state = ResultState.noData;
          notifyListeners();
          _message = 'Empty data';
        } else {
          _state = ResultState.hasData;
          notifyListeners();
          _restaurantResult = restaurant;
        }
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      _message = 'Error -> $e';
    }
  }

  setQuery(value) {
    query = value;
    _fetchRestaurant(query);
    notifyListeners();
  }

  refresh() {
    _fetchRestaurant(query);
    notifyListeners();
  }
}
