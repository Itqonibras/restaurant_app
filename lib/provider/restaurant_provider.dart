import 'package:flutter/foundation.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_model.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantProvider extends ChangeNotifier{
  final ApiService apiService;

  RestaurantProvider({required this.apiService}){
    _fetchRestaurant();
  }

  late RestaurantResult _restaurantResult;

  RestaurantResult get result => _restaurantResult;

  String _message= '';

  String get message => _message;

  late ResultState _state;

  ResultState get state => _state;

  Future<dynamic> _fetchRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurant = await apiService.restaurant();
      if (restaurant.restaurants!.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantResult = restaurant;
      }
    } catch(e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error -> $e';
    }
  }

  refresh() {
    _fetchRestaurant();
    notifyListeners();
  }
}